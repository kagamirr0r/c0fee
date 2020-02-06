resource "aws_ssm_parameter" "rails_master_key" {
  name        = "/rails/master_key"
  value       = "hoge"
  type        = "SecureString"
  description = "Rails_Master_Key"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "db_username" {
  name        = "/rails/db_username"
  value       = "hoge"
  type        = "SecureString"
  description = "DB_USERNAME"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "db_password" {
  name        = "/rails/db_password"
  value       = "hoge"
  type        = "SecureString"
  description = "DB_PASSWORD"

  lifecycle {
    ignore_changes = [value]
  }
}
