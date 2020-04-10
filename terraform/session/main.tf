data "terraform_remote_state" "c0fee" {
  backend = "s3"

  config = {
    bucket = "c0fee-tfstate"
    key    = "terraform/.terraform/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

resource "aws_ecr_repository" "session" {
  name = "c0fee_session"
}

resource "aws_ecr_lifecycle_policy" "session" {
  repository = aws_ecr_repository.session.name

  policy = <<EOF
	{
		"rules":[
			{
				"rulePriority":1,
				"description": "Keep last 10 release tagged images",
				"selection":{
					"tagStatus":"tagged",
					"tagPrefixList":["release"],
					"countType": "imageCountMoreThan",
					"countNumber":10
				},
				"action":{
					"type":"expire"
				}
			}
		]
	}
EOF
}

output "ecr_repository_url" {
  value = aws_ecr_repository.session.repository_url
}

resource "aws_ecs_cluster" "session" {
  name = "c0fee-session"
}

# resource "aws_ecs_service" "session" {
#   name            = "c0fee_session"
#   cluster         = aws_ecs_cluster.session.arn
#   task_definition = aws_ecs_task_definition.session.arn
#   desired_count   = 1

#   network_configuration {
#     assign_public_ip = false
#     security_groups  = [data.terraform_remote_state.c0fee.outputs.rails_sg_security_group_id]
#     subnets = [
#       data.terraform_remote_state.c0fee.outputs.subnet_private_1_id
#     ]
#   }

#   lifecycle {
#     ignore_changes = [task_definition]
#   }
# }

data "aws_iam_role" "ec2_role" {
  name = data.terraform_remote_state.c0fee.outputs.ecs_task_execution_role_name
}

data "aws_iam_policy" "ec2_role_for_SSM" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_role_policy_attachment" "ssm_role" {
  role       = data.aws_iam_role.ec2_role.name
  policy_arn = data.aws_iam_policy.ec2_role_for_SSM.arn
}

resource "aws_ecs_task_definition" "session" {
  family                   = "c0fee-session"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./session_container.json")
  task_role_arn            = data.terraform_remote_state.c0fee.outputs.ecs_task_role_iam_role_arn
  execution_role_arn       = data.aws_iam_role.ec2_role.arn
}
