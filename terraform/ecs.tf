#___ECS Cluster________________________________________________________________________________________________________
resource "aws_ecs_cluster" "c0fee" {
  name = "c0fee"
}
#___ECS Service__________________________________________________________________________________________________
resource "aws_ecs_service" "c0fee" {
  name                              = "c0fee"
  cluster                           = aws_ecs_cluster.c0fee.arn
  task_definition                   = aws_ecs_task_definition.c0fee.arn
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 60

  network_configuration {
    assign_public_ip = false
    security_groups  = [module.rails_sg.security_group_id]
    subnets = [
      aws_subnet.private_1.id,
      aws_subnet.private_2.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.c0fee.arn
    container_name   = "c0fee"
    container_port   = 3000
  }

  lifecycle {
    ignore_changes = [task_definition]
  }
}
module "rails_sg" {
  source      = "./modules/security_group/"
  name        = "rails-sg"
  vpc_id      = aws_vpc.c0fee.id
  port        = 3000
  cidr_blocks = [aws_vpc.c0fee.cidr_block]
}
#___Task Definition__________________________________________________________________________________________________
resource "aws_ecs_task_definition" "c0fee" {
  family                   = "c0fee"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./container_definitions.json")
  task_role_arn            = module.ecs_task_role.iam_role_arn
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

# IAM Role for task_role (RDS and S3)
module "ecs_task_role" {
  source     = "./modules/iam_role"
  name       = "ecs-task-role"
  identifier = "ecs-tasks.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs_task.json
}

data "aws_iam_policy_document" "ecs_task" {
  source_json = data.aws_iam_policy.rds_full_access_policy.policy

  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}

data "aws_iam_policy" "rds_full_access_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

#IAM Role for execution_role (ECSTaskExecutionRolePolicy + SSM + KMS)
module "ecs_task_execution_role" {
  source     = "./modules/iam_role"
  name       = "ecs-task-execution"
  identifier = "ecs-tasks.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs_task_execution.json
}

data "aws_iam_policy_document" "ecs_task_execution" {
  source_json = data.aws_iam_policy.ecs_task_execution_role_policy.policy

  statement {
    effect = "Allow"
    actions = ["kms:Decrypt",
      "ssm:GetParameters",
      "cloudwatch:PutMetricData",
      "ec2:DescribeVolumes",
      "ec2:DescribeTags",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "logs:DescribeLogGroups",
      "logs:CreateLogGroup"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

#___Cloud Watch Logs___________________________________________________________________________________________
resource "aws_cloudwatch_log_group" "for_ecs" {
  name              = "/ecs/c0fee"
  retention_in_days = 180
}

resource "aws_cloudwatch_log_subscription_filter" "c0fee" {
  name            = "c0fee"
  log_group_name  = aws_cloudwatch_log_group.for_ecs.name
  destination_arn = aws_kinesis_firehose_delivery_stream.c0fee.arn
  filter_pattern  = "[]"
  role_arn        = module.cloudwatch_logs_role.iam_role_arn
}

# IAM Role for CloudWatch to use Kinesis FireHose
module "cloudwatch_logs_role" {
  source     = "./modules/iam_role/"
  name       = "cloudwatch-logs"
  identifier = "logs.ap-northeast-1.amazonaws.com"
  policy     = data.aws_iam_policy_document.cloudwatch_logs.json
}
data "aws_iam_policy_document" "cloudwatch_logs" {
  statement {
    effect    = "Allow"
    actions   = ["Firehose:*"]
    resources = ["arn:aws:firehose:ap-northeast-1:*:*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["iam:PassRole"]
    resources = ["arn:aws:iam::*:role/cloudwatch-logs"]
  }
}


#___Kinesis Fire Hose___________________________________________________________________________________________
resource "aws_kinesis_firehose_delivery_stream" "c0fee" {
  name        = "c0fee"
  destination = "s3"
  s3_configuration {
    role_arn   = module.kinesis_data_firehose_role.iam_role_arn
    bucket_arn = aws_s3_bucket.ecs_logs.arn
    prefix     = "ecs-logs/c0fee/"
  }
}

module "kinesis_data_firehose_role" {
  source     = "./modules/iam_role/"
  name       = "kinesis-data-firehose"
  identifier = "firehose.amazonaws.com"
  policy     = data.aws_iam_policy_document.kinesis_data_firehose.json
}

data "aws_iam_policy_document" "kinesis_data_firehose" {
  statement {
    effect = "Allow"
    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject",
    ]

    resources = ["arn:aws:s3:::${aws_s3_bucket.ecs_logs.id}", "arn:aws:s3:::${aws_s3_bucket.ecs_logs.id}/*", ]
  }
}

#___ECS Log Bucket___________________________________________________________________________________________
resource "aws_s3_bucket" "ecs_logs" {
  bucket = "c0fee-ecs-logs"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}



