resource "aws_vpc" "vpc" {
  tags = {
    OWNER      = var.owner
    DEPARTMENT = var.department
  }

  cidr_block = var.cidr_block_VPC
}

resource "aws_eip" "lb" {
  vpc = true

  depends_on = [
    aws_internet_gateway.igw
  ]
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.subnet_public_az1.id

  tags = {
    OWNER      = var.owner
    DEPARTMENT = var.department
  }

  depends_on = [
    aws_internet_gateway.igw
  ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    OWNER      = var.owner
    DEPARTMENT = var.department
  }
}

resource "aws_subnet" "subnet_public_az1" {
  vpc_id = aws_vpc.vpc.id

  availability_zone = var.az1

  cidr_block = "10.10.1.0/24"

  tags = {
    OWNER      = var.owner
    DEPARTMENT = var.department
  }
}

resource "aws_subnet" "subnet_public_az2" {
  vpc_id = aws_vpc.vpc.id

  availability_zone = var.az2

  cidr_block = "10.10.2.0/24"

  tags = {
    OWNER      = var.owner
    DEPARTMENT = var.department
  }
}

resource "aws_subnet" "subnet_private_az1" {
  vpc_id = aws_vpc.vpc.id

  availability_zone = var.az2

  cidr_block = "10.10.3.0/24"

  tags = {
    OWNER      = var.owner
    DEPARTMENT = var.department
  }
}

resource "aws_subnet" "subnet_private_az2" {
  vpc_id = aws_vpc.vpc.id

  availability_zone = var.az2

  cidr_block = "10.10.4.0/24"

  tags = {
    OWNER      = var.owner
    DEPARTMENT = var.department
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    OWNER      = var.owner
    DEPARTMENT = var.department
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    OWNER      = var.owner
    DEPARTMENT = var.department
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.subnet_public_az1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.subnet_public_az2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.subnet_private_az1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.subnet_private_az2.id
  route_table_id = aws_route_table.public_rt.id
}