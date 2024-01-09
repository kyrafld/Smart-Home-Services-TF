resource "aws_vpc" "smart_home" {
  cidr_block           = var.cidr_range
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets)

  vpc_id                  = aws_vpc.smart_home.id
  availability_zone       = var.azs[count.index]
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.smart_home.id
  availability_zone = var.azs[count.index]
  cidr_block        = var.private_subnets[count.index]


}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.smart_home.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.smart_home.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_routes" {
  count          = length(aws_subnet.public_subnets[*])
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_subnets[count.index].id
}
