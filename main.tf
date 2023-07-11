# Configure the AWS provider
provider "aws" {
  region = var.aws_region
}

# Create the VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

# Create an internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# Create public subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block_1
  availability_zone       = var.public_subnet_az_1
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block_2
  availability_zone       = var.public_subnet_az_2
}

# Create private subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr_block_1
  availability_zone       = var.private_subnet_az_1
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr_block_2
  availability_zone       = var.private_subnet_az_2
}

# Create public route table and associate with public subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

# Create private route table and associate with private subnets
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}

# Create a default route in the public route table to the internet gateway
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}
