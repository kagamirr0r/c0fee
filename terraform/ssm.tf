resource "aws_ssm_parameter" "rails_master_key" {
  name        = "/rails/master_key"
  value       = "hoge"
  type        = "SecureString"
  description = "Rails_Master_Key"

  lifecycle {
    ignore_changes = [value]
  }
}

