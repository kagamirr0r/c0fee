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

#___Internet Gateway_____________________________________________________________________________________________________
resource "aws_internet_gateway" "c0fee" {
  vpc_id = aws_vpc.c0fee.id
}

#___Subnet (Multi-AZ)_____________________________________________________________________________________________________
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.c0fee.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.c0fee.id
  cidr_block              = "10.0.16.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1c"
}

resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.c0fee.id
  cidr_block              = "10.0.32.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-northeast-1a"
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.c0fee.id
  cidr_block              = "10.0.64.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-northeast-1c"
}

#___Routing_____________________________________________________________________________________________________

#Public
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.c0fee.id
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.c0fee.id
  destination_cidr_block = "0.0.0.0/0"
}


#Private
resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.c0fee.id
}
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}

resource "aws_route_table" "private_2" {
  vpc_id = aws_vpc.c0fee.id
}
resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}

#___EIP_____________________________________________________________________________________________________

# For Nat_Gateway_1
resource "aws_eip" "eip_1" {
  vpc        = true
  depends_on = [aws_internet_gateway.c0fee]
}

# For Nat_Gateway_2
resource "aws_eip" "eip_2" {
  vpc        = true
  depends_on = [aws_internet_gateway.c0fee]
}

#___Nat Gateway________________________________________________________________________________________________
resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id = aws_eip.eip_1.id
  subnet_id     = aws_subnet.public_1.id
  depends_on    = [aws_internet_gateway.c0fee]
}

resource "aws_nat_gateway" "nat_gateway_2" {
  allocation_id = aws_eip.eip_2.id
  subnet_id     = aws_subnet.public_2.id
  depends_on    = [aws_internet_gateway.c0fee]
}

