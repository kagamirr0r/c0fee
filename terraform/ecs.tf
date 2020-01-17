resource "aws_ecs_cluster" "c0fee" {
  name = "c0fee"
}

resource "aws_ecs_task_definition" "c0fee" {
  family                   = "c0fee"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./container_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

module "ecs_task_execution_role" {
  source     = "./modules/iam_role"
  name       = "ecs-task-execution"
  identifier = "ecs-tasks.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs_task_execution.json
}

data "aws_iam_policy_document" "ecs_task_execution" {
  source_json = data.aws_iam_policy.ecs_task_execution_role_policy.policy

  statement {
    effect    = "Allow"
    actions   = ["ssm:GetParameters", "kms:Decrypt"]
    resources = ["*"]
  }
}

data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_service" "c0fee" {
  name             = "c0fee"
  cluster          = aws_ecs_cluster.c0fee.arn
  task_definition  = aws_ecs_task_definition.c0fee.arn
  desired_count    = 2
  launch_type      = "FARGATE"
  platform_version = "1.3.0"

  health_check_grace_period_seconds = 60

  network_configuration {
    assign_public_ip = false
    security_groups  = [module.nginx_sg.security_group_id]

    subnets = [
      aws_subnet.private_1.id,
      aws_subnet.private_2.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.c0fee.arn
    container_name   = "c0fee"
    container_port   = 80
  }

  lifecycle {
    ignore_changes = [task_definition]
  }
}
module "nginx_sg" {
  source      = "./modules/security_group"
  name        = "nginx-sg"
  vpc_id      = aws_vpc.c0fee.id
  port        = 80
  cidr_blocks = [aws_vpc.c0fee.cidr_block]
}


resource "aws_ecs_task_definition" "c0fee_batch" {
  family                   = "c0fee-batch"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./batch_container_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

data "aws_iam_policy" "ecs_events_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceEventsRole"
}
