resource "aws_db_parameter_group" "c0fee" {
  name   = "c0fee"
  family = "postgres11"
}

resource "aws_db_option_group" "c0fee" {
  name                 = "c0fee"
  engine_name          = "postgres"
  major_engine_version = "11"
}

resource "aws_db_subnet_group" "c0fee" {
  name       = "c0fee"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

module "psgl_sg" {
  source      = "./modules/security_group/"
  name        = "psql-sg"
  vpc_id      = aws_vpc.c0fee.id
  port        = 5432
  cidr_blocks = [aws_vpc.c0fee.cidr_block]
}
resource "aws_db_instance" "c0fee" {
  identifier                 = "c0fee"
  engine                     = "postgres"
  engine_version             = "11.5"
  instance_class             = "db.t3.small"
  allocated_storage          = 20
  storage_type               = "gp2"
  storage_encrypted          = true
  kms_key_id                 = aws_kms_key.c0fee.arn
  username                   = "onyanpokon"
  password                   = "VeryStrongPassword"
  multi_az                   = true
  publicly_accessible        = false
  backup_window              = "09:10-09:40"
  backup_retention_period    = 30
  maintenance_window         = "mon:10:10-mon:10:40"
  auto_minor_version_upgrade = false
  deletion_protection        = false
  skip_final_snapshot        = true
  port                       = 5432
  apply_immediately          = false
  vpc_security_group_ids     = [module.psgl_sg.security_group_id]
  parameter_group_name       = aws_db_parameter_group.c0fee.name
  option_group_name          = aws_db_option_group.c0fee.name
  db_subnet_group_name       = aws_db_subnet_group.c0fee.name

  lifecycle {
    ignore_changes = [password]
  }
}
