resource "aws_elasticache_parameter_group" "c0fee" {
  name   = "c0fee"
  family = "redis5.0"
  parameter {
    name  = "cluster-enabled"
    value = "no"
  }
}

resource "aws_elasticache_subnet_group" "c0fee" {
  name       = "c0fee"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

module "redis_sg" {
  source      = "./modules/security_group/"
  name        = "redis-sg"
  vpc_id      = aws_vpc.c0fee.id
  port        = 6379
  cidr_blocks = [aws_vpc.c0fee.cidr_block]
}

resource "aws_elasticache_replication_group" "c0fee" {
  replication_group_id          = "c0fee"
  replication_group_description = "Cluster Disabled"
  engine                        = "redis"
  engine_version                = "5.0.3"
  number_cache_clusters         = 3
  node_type                     = "cache.m3.medium"
  snapshot_window               = "09:10-10:10"
  snapshot_retention_limit      = 7
  maintenance_window            = "mon:10:40-mon:11:40"
  automatic_failover_enabled    = true
  port                          = 6379
  apply_immediately             = false
  security_group_ids            = [module.redis_sg.security_group_id]
  parameter_group_name          = aws_elasticache_parameter_group.c0fee.name
  subnet_group_name             = aws_elasticache_subnet_group.c0fee.name
}
