output "subnet_private_1_id" {
  value = aws_subnet.private_1.id
}

output "subnet_private_2_id" {
  value = aws_subnet.private_2.id
}


output "ecr_repository_url" {
  value = aws_ecr_repository.c0fee.repository_url
}
