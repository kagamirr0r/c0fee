resource "aws_security_group" "c0fee" {
  name   = "c0fee"
  vpc_id = aws_vpc.c0fee.id
}

resource "aws_security_group_rule" "ingress_c0fee" {
  type              = "ingress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.c0fee.id
}

resource "aws_security_group_rule" "egress_c0fee" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.c0fee.id
}
