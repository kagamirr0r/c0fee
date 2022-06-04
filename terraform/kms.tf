resource "aws_kms_key" "c0fee" {
  description             = "Master Key"
  enable_key_rotation     = true
  is_enabled              = true
  deletion_window_in_days = 30
}

resource "aws_kms_alias" "c0fee" {
  name          = "alias/c0fee_key"
  target_key_id = aws_kms_key.c0fee.key_id
}
