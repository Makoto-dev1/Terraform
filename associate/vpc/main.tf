resource "aws_default_vpc" "vpc" {
  tags = {
    OWNER = var.owner
    DEPARTMENT = var.department
  }
}

resource "aws_default_subnet" "subnetaz1" {
    availability_zone = var.az1

    tags = {
    OWNER = var.owner
    DEPARTMENT = var.department
  }
}