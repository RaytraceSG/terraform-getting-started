# Create public route table

resource "aws_route_table" "azmi1-tf-public-rtb" {
  vpc_id = aws_vpc.azmi1-tf-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.azmi1-tf-igw.id
  }

  tags = {
    Name = "azmi1-tf-public-rtb"
  }
}

# Create private route tables

resource "aws_route_table" "azmi1-tf-private-rtb-az1" {
  vpc_id = aws_vpc.azmi1-tf-vpc.id

#  route {
#    cidr_block = "10.0.128.0/20"
#    vpc_endpoint_id = aws_vpc_endpoint.azmi1-vpce-s3.id
#    
#  }

  tags = {
    Name = "azmi1-tf-private-rtb-az1"
  }
}

resource "aws_route_table" "azmi1-tf-private-rtb-az2" {
  vpc_id = aws_vpc.azmi1-tf-vpc.id

#  route {
#    cidr_block = "10.0.144.0/20"
#    vpc_endpoint_id = aws_vpc_endpoint.azmi1-vpce-s3.id
#    
#  }

  tags = {
    Name = "azmi1-tf-private-rtb-az2"
  }
}

# Create route table associations
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.azmi1-tf-public-subnet-az1.id
  route_table_id = aws_route_table.azmi1-tf-public-rtb.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.azmi1-tf-public-subnet-az2.id
  route_table_id = aws_route_table.azmi1-tf-public-rtb.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.azmi1-tf-private-subnet-az1.id
  route_table_id = aws_route_table.azmi1-tf-private-rtb-az1.id
}
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.azmi1-tf-private-subnet-az2.id
  route_table_id = aws_route_table.azmi1-tf-private-rtb-az2.id
}

resource "aws_vpc_endpoint_route_table_association" "a" {
  route_table_id  = aws_route_table.azmi1-tf-private-rtb-az1.id
  vpc_endpoint_id = aws_vpc_endpoint.azmi1-tf-vpce-s3.id
}
resource "aws_vpc_endpoint_route_table_association" "b" {
  route_table_id  = aws_route_table.azmi1-tf-private-rtb-az2.id
  vpc_endpoint_id = aws_vpc_endpoint.azmi1-tf-vpce-s3.id
}