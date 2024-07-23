# Create public route table

resource "aws_route_table" "azmi1-rtb-public" {
  vpc_id = aws_vpc.azmi1-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.azmi1-igw.id
  }

  tags = {
    Name = "azmi1-rtb-public"
  }
}

# Create private route tables

resource "aws_route_table" "azmi1-rtb-private1-us-east-1a" {
  vpc_id = aws_vpc.azmi1-vpc.id

#  route {
#    cidr_block = "10.0.128.0/20"
#    vpc_endpoint_id = aws_vpc_endpoint.azmi1-vpce-s3.id
#    
#  }

  tags = {
    Name = "azmi1-rtb-private1-us-east-1a"
  }
}

resource "aws_route_table" "azmi1-rtb-private2-us-east-1b" {
  vpc_id = aws_vpc.azmi1-vpc.id

#  route {
#    cidr_block = "10.0.144.0/20"
#    vpc_endpoint_id = aws_vpc_endpoint.azmi1-vpce-s3.id
#    
#  }

  tags = {
    Name = "azmi1-rtb-private2-us-east-1b"
  }
}

# Create route table associations
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.azmi1-subnet-public1-us-east-1a.id
  route_table_id = aws_route_table.azmi1-rtb-public.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.azmi1-subnet-public2-us-east-1b.id
  route_table_id = aws_route_table.azmi1-rtb-public.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.azmi1-subnet-private1-us-east-1a.id
  route_table_id = aws_route_table.azmi1-rtb-private1-us-east-1a.id
}
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.azmi1-subnet-private2-us-east-1b.id
  route_table_id = aws_route_table.azmi1-rtb-private2-us-east-1b.id
}

resource "aws_vpc_endpoint_route_table_association" "a" {
  route_table_id  = aws_route_table.azmi1-rtb-private1-us-east-1a.id
  vpc_endpoint_id = aws_vpc_endpoint.azmi1-vpce-s3.id
}
resource "aws_vpc_endpoint_route_table_association" "b" {
  route_table_id  = aws_route_table.azmi1-rtb-private2-us-east-1b.id
  vpc_endpoint_id = aws_vpc_endpoint.azmi1-vpce-s3.id
}