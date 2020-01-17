resource "aws_ssm_parameter" "db_password" {
  name        = "/db/password"
  value       = "uninitialized"
  type        = "SecureString"
  description = "データベースのパスワード"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "db_username" {
  name        = "/db/username"
  value       = "onyanpokon"
  type        = "SecureString"
  description = "データベースのユーザー名"

  lifecycle {
    ignore_changes = [value]
  }
}
