variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0b72821e2f351e396"
}

variable "ec2_name" {
  description = "Name of EC2"
  type        = string
  default     = "azmi1-tf-ec2" # Change accordingly
}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.micro"
}

# variable "key_name" {
#   description = "Name of EC2 Key Pair"
#   type        = string
#   default     = "azmi1-keypair-useast1" # Change accordingly
# }

variable "sg_name" {
  description = "Name of EC2 security group"
  type        = string
  default     = "azmi1-tf-sg-allow-ssh-http-https" # Change accordingly
}

variable "vpc_name" {
  description = "Name of VPC to use"
  type        = string
  default     = "azmi1-tf-vpc" # Change accordingly
}

variable "subnet_name" {
  description = "Name of subnet to use"
  type        = string
  default     = "azmi1-subnet-public1-us-east-1a" # Change accordingly
}