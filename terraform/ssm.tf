resource "aws_ssm_parameter" "rails_master_key" {
  name        = "/rails/master_key"
  value       = "hoge"
  type        = "SecureString"
  description = "Rails_Master_Key"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "postgres_user" {
  name        = "/rails/postgres_user"
  value       = "hoge"
  type        = "SecureString"
  description = "POSTGRES_USER"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "postgres_password" {
  name        = "/rails/postgres_password"
  value       = "hoge"
  type        = "SecureString"
  description = "POSTGRES_PASSWORD"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "rds_host" {
  name        = "/rails/rds_host"
  value       = "hoge"
  type        = "SecureString"
  description = "RDS_HOST"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "rds_database" {
  name        = "/rails/rds_database"
  value       = "hoge"
  type        = "SecureString"
  description = "RDS_DATABASE"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "rds_username" {
  name        = "/rails/rds_username"
  value       = "hoge"
  type        = "SecureString"
  description = "RDS_USERNAME"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "rds_password" {
  name        = "/rails/rds_password"
  value       = "hoge"
  type        = "SecureString"
  description = "RDS_PASSWORD"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "rails_log_to_stdout" {
  name        = "/rails/rails_log_to_stdout"
  value       = "1"
  type        = "SecureString"
  description = "RAILS_LOG_TO_STDOUT"

  lifecycle {
    ignore_changes = [value]
  }
}

