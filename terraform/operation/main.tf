data "terraform_remote_state" "c0fee" {
  backend = "s3"

  config = {
    bucket = "c0fee-tfstate"
    key    = "terraform/.terraform/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

module "operation_role" {
  source     = "../modules/iam_role"
  name       = "operation"
  identifier = "ec2.amazonaws.com"
  policy     = data.aws_iam_policy_document.operation_policy.json
}

data "aws_iam_policy_document" "operation_policy" {
  source_json = data.aws_iam_policy.ec2_for_ssm.policy

  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ssm:GetParameter",
      "ssm:GetParameters",
      "ssm:GetParametersByPath",
      "kms:Decrypt",
      "rds:*",
      "s3:*"
    ]
  }
}

data "aws_iam_policy" "ec2_for_ssm" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_instance_profile" "operation" {
  name = "operation"
  role = module.operation_role.iam_role_name
}

resource "aws_instance" "operation" {
  ami                  = "ami-06ad9296e6cf1e3cf"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.operation.name
  subnet_id            = data.terraform_remote_state.c0fee.outputs.subnet_private_1_id
  user_data            = file("./user_data.sh")
}

output "operation_instance_id" {
  value = aws_instance.operation.id
}

resource "aws_s3_bucket" "operation" {
  bucket = "operation-c0fee"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}

resource "aws_cloudwatch_log_group" "operation" {
  name              = "/operation"
  retention_in_days = 180
}

resource "aws_ssm_document" "session_manager_run_shell" {
  name            = "SSM-SessionManagerRunShell"
  document_type   = "Session"
  document_format = "JSON"

  content = <<EOF
	{
		"schemaVersion": "1.0",
		"description":"Document to hold regional setting for Session Manager",
		"sessionType":"Standard_Stream",
		"inputs":{
			"s3BucketName":"$(aws_s3_bucket.operation.id)",
			"cloudWatchLogGroupName":"$(aws_cloudwatch_log_group.operation.name)"
		}
	}
EOF
}
