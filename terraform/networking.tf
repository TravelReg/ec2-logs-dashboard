resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "monitoring-vpc"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "monitoring-public-subnet"
  }
}

resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.vpc-1.id
}

resource "aws_route_table" "route-table-1" {
  vpc_id = aws_vpc.vpc-1.id
}

resource "aws_route" "internet" {
  route_table_id         = aws_route_table.route-table-1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw-1.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.route-table-1.id
}