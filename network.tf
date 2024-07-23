# Creates a vpc

resource "aws_vpc" "azmi1-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "azmi1-vpc"
  }
}

# Create 2 public and 2 private subnets

resource "aws_subnet" "azmi1-subnet-public1-us-east-1a" {
  vpc_id     = aws_vpc.azmi1-vpc.id
  cidr_block = "10.0.0.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "azmi1-subnet-public1-us-east-1a"
  }
}

resource "aws_subnet" "azmi1-subnet-public2-us-east-1b" {
  vpc_id     = aws_vpc.azmi1-vpc.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "azmi1-subnet-public2-us-east-1b"
  }
}

resource "aws_subnet" "azmi1-subnet-private1-us-east-1a" {
  vpc_id     = aws_vpc.azmi1-vpc.id
  cidr_block = "10.0.128.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "azmi1-subnet-private1-us-east-1a"
  }
}
resource "aws_subnet" "azmi1-subnet-private2-us-east-1b" {
  vpc_id     = aws_vpc.azmi1-vpc.id
  cidr_block = "10.0.144.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "azmi1-subnet-private2-us-east-1b"
  }
}

# Create an internet gateway

resource "aws_internet_gateway" "azmi1-igw" {
  vpc_id = aws_vpc.azmi1-vpc.id

  tags = {
    Name = "azmi1-igw"
  }
}

#Create an internet gateway attachment

#resource "aws_internet_gateway_attachment" "example" {
#  internet_gateway_id = aws_internet_gateway.azmi1-igw.id
#  vpc_id              = aws_vpc.azmi1-vpc.id
#}

# Create a VPC Endpoint for S3

resource "aws_vpc_endpoint" "azmi1-vpce-s3" {
  vpc_id       = aws_vpc.azmi1-vpc.id
  service_name = "com.amazonaws.us-east-1.s3"

  tags = {
    Name = "azmi1-vpce-s3"
  }
}






# Uses an existing VPC, filtered by vpc_name in variables.tf
# data "aws_vpc" "selected_vpc" {
#  filter {
#    name   = "tag:Name"
#    values = [var.vpc_name]
#  }
# }

# Uses an existing subnet, filtered by subnet_name in variables.tf
# data "aws_subnet" "selected_subnet" {
#  filter {
#    name   = "tag:Name"
#    values = [var.subnet_name]
#  }
# }