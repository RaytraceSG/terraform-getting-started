# Creates a security group that allows us to create 
# ingress rules allowing traffic for HTTP, HTTPS and SSH protocols from anywhere
resource "aws_security_group" "azmi1-tf-sg-allow-ssh-http-https" {
  name   = var.sg_name
  vpc_id = aws_vpc.azmi1-tf-vpc.id # var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "azmi1-tf-sg-allow-ssh-http-https"
  }
}

# Uses an existing security group, filtered by sg_name in variables.tf
# data "aws_security_group" "selected_security_group" {
#  filter {
#    name   = "tag:Name"
#    values = [var.sg_name]
#  }
#}