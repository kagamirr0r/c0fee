# output "alb_dns_name" {
#   value = aws_lb.c0fee.dns_name
# }

# output "security_group_id" {
#   value = aws_security_group.vpc.id
# }

output "subnet_private_1_id" {
  value = aws_subnet.private_1.id
}

output "subnet_private_2_id" {
  value = aws_subnet.private_2.id
}

output "ecs_task_role_iam_role_arn" {
  value = module.ecs_task_role.iam_role_arn
}

output "ecs_task_role_iam_role_name" {
  value = module.ecs_task_role.iam_role_name
}

output "ecs_task_execution_role_iam_role_arn" {
  value = module.ecs_task_execution_role.iam_role_arn
}

output "ecs_task_execution_role_name" {
  value = module.ecs_task_execution_role.iam_role_name
}

output "rails_sg_security_group_id" {
  value = module.rails_sg.security_group_id
}

output "cluster_arn" {
  value = aws_ecs_cluster.c0fee.arn
}

