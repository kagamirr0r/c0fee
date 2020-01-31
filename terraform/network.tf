#___VPC_____________________________________________________________________________________________________
resource "aws_vpc" "c0fee" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "c0fee_vpc"
  }
}

resource "aws_security_group" "vpc" {
  name   = "vps-sg"
  vpc_id = aws_vpc.c0fee.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "security_group_id" {
  value = aws_security_group.vpc.id
}

#___Internet Gateway_____________________________________________________________________________________________________
resource "aws_internet_gateway" "c0fee" {
  vpc_id = aws_vpc.c0fee.id
}

#___Subnet_____________________________________________________________________________________________________
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.c0fee.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.c0fee.id
  cidr_block = "10.0.64.0/24"
}

#___Route Table_____________________________________________________________________________________________________
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.c0fee.id
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.c0fee.id
}
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "praivate" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

#___Route_____________________________________________________________________________________________________
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.c0fee.id
  destination_cidr_block = "0.0.0.0/0"
}

#___EIP_____________________________________________________________________________________________________
resource "aws_eip" "nat_gateway" {
  vpc        = true
  depends_on = [aws_internet_gateway.c0fee]
}


#___Nat Gateway________________________________________________________________________________________________
resource "aws_nat_gateway" "c0fee" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public.id
  depends_on    = [aws_internet_gateway.c0fee]
}

