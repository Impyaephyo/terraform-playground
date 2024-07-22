resource "aws_vpc" "lab_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "LAB_VPC"
  }
}

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(var.tags, { Name = "Public_subnet_${count.index + 1}" })
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(var.tags, { Name = "Private_subnet_${count.index + 1}" })
}

#Internet Gateway (IGW)
resource "aws_internet_gateway" "labigw" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    Name = "LAB IGW"
  }
}

#NAT Public Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
  tags = {
    Name = "NAT Public Gateway"
  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = merge(var.tags, { Name = "NAT Public Gateway" })
}