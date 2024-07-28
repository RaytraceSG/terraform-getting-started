# This code block allows us to create an ec2 instance with hardcoded values
#resource "aws_instance" "sample_ec2_hardcoded" {
#  ami           = "ami-0b72821e2f351e396"
#  instance_type = "t2.micro"
#  key_name      = "azmi1-keypair-useast1" # change to your own keypair name
#  subnet_id     = "subnet-0eeb40b23b6f1757e" # change to your own vpc subnet id
#  associate_public_ip_address = true
#  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

#  tags = {
#    Name = "azmi1-webserver-terraform"
#  }
#}

# This code block allows us to create an ec2 instance with the use of variables
# To overwrite any one particular variable, we can pass the variable at runtime during terraform apply step
# e.g. terraform apply --var ec2_name="my-webserver"

resource "aws_instance" "azmi1-tf-ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.azmi1-tf-keypair.key_name
  subnet_id     = aws_subnet.azmi1-tf-public-subnet-az1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.azmi1-tf-sg-allow-ssh-http-https.id]
  
  depends_on = [aws_internet_gateway.azmi1-tf-igw]

  tags = {
    Name = "azmi1-tf-ec2"
  }
}