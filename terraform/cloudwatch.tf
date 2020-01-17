resource "aws_cloudwatch_log_group" "for_ecs" {
  name              = "/ecs/c0fee"
  retention_in_days = 180
}

resource "aws_cloudwatch_log_group" "for_ecs_scheduled_tasks" {
  name              = "/ecs-scheduled-tasks/c0fee"
  retention_in_days = 180
}

resource "aws_cloudwatch_event_target" "c0fee_batch" {
  target_id = "c0fee-batch"
  rule      = aws_cloudwatch_event_rule.c0fee_batch.name
  role_arn  = module.ecs_events_role.iam_role_arn
  arn       = aws_ecs_cluster.c0fee.arn

  ecs_target {
    launch_type         = "FARGATE"
    task_count          = 1
    platform_version    = "1.3.0"
    task_definition_arn = aws_ecs_task_definition.c0fee_batch.arn

    network_configuration {
      assign_public_ip = "false"
      subnets          = [aws_subnet.private_1.id]

    }
  }
}
resource "aws_cloudwatch_event_rule" "c0fee_batch" {
  name                = "c0fee-batch"
  description         = "とても重要なバッチです"
  schedule_expression = "cron(*/2 * * * ? *)"
}

module "ecs_events_role" {
  source     = "./modules/iam_role"
  name       = "ecs-events"
  identifier = "events.amazonaws.com"
  policy     = data.aws_iam_policy.ecs_events_role_policy.policy
}

