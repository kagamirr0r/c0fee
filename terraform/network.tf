#___VPC_____________________________________________________________________________________________________
resource "aws_vpc" "c0fee" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "C0FEE_VPC"
  }
}

resource "aws_security_group" "vpc" {
  name   = "vpc-sg"
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
  tags = {
    Name = "C0FEE_IG"
  }
}

#___Subnet (Multi-AZ)_____________________________________________________________________________________________________

#Public
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.c0fee.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"

  tags = {
    Name = "Public1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.c0fee.id
  cidr_block              = "10.0.16.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1c"

  tags = {
    Name = "Public2"
  }
}

#Private
resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.c0fee.id
  cidr_block              = "10.0.32.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-northeast-1a"

  tags = {
    Name = "Private1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.c0fee.id
  cidr_block              = "10.0.64.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-northeast-1c"

  tags = {
    Name = "Private2"
  }
}

#___Routing_____________________________________________________________________________________________________

#Public
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.c0fee.id

  tags = {
    Name = "Public Subnets"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.c0fee.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

#Private
resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.c0fee.id

  tags = {
    Name = "Private_1"
  }
}
resource "aws_route" "private_1" {
  route_table_id         = aws_route_table.private_1.id
  nat_gateway_id         = aws_nat_gateway.nat_gateway_1.id
  destination_cidr_block = "0.0.0.0/0"
}
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}

resource "aws_route_table" "private_2" {
  vpc_id = aws_vpc.c0fee.id

  tags = {
    Name = "Private_2"
  }
}
resource "aws_route" "private_2" {
  route_table_id         = aws_route_table.private_2.id
  nat_gateway_id         = aws_nat_gateway.nat_gateway_2.id
  destination_cidr_block = "0.0.0.0/0"
}
resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_2.id
}

#___Nat Gateway________________________________________________________________________________________________
resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id = aws_eip.eip_1.id
  subnet_id     = aws_subnet.public_1.id
  depends_on    = [aws_internet_gateway.c0fee]

  tags = {
    Name = "Private_1"
  }
}

resource "aws_nat_gateway" "nat_gateway_2" {
  allocation_id = aws_eip.eip_2.id
  subnet_id     = aws_subnet.public_2.id
  depends_on    = [aws_internet_gateway.c0fee]

  tags = {
    Name = "Private_2"
  }
}

#___EIP_____________________________________________________________________________________________________

# For Nat_Gateway_1
resource "aws_eip" "eip_1" {
  vpc        = true
  depends_on = [aws_internet_gateway.c0fee]

  tags = {
    Name = "NatGate_1"
  }
}

# For Nat_Gateway_2
resource "aws_eip" "eip_2" {
  vpc        = true
  depends_on = [aws_internet_gateway.c0fee]

  tags = {
    Name = "NatGate_2"
  }
}

#___VPC_ENDPOINT_____________________________________________________________________________________________________

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.c0fee.id
  service_name = "com.amazonaws.ap-northeast-1.s3"

  tags = {
    Name = "C0FEE_EP"
  }
}

resource "aws_vpc_endpoint_route_table_association" "private_1_s3" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = aws_route_table.private_1.id
}

resource "aws_vpc_endpoint_route_table_association" "private_2_s3" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = aws_route_table.private_2.id
}

