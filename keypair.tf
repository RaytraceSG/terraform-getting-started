# RSA key of size 4096 bits
resource "tls_private_key" "azmi1-tf-tls" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "azmi1-tf-keypair" {
  key_name   = "azmi1-tf-keypair"
  public_key = tls_private_key.azmi1-tf-tls.public_key_openssh
}

resource "local_file" "azmi1-tf-private-key" {
  content  = tls_private_key.azmi1-tf-tls.private_key_pem
  filename = "${path.module}/azmi1-tf-private-key.pem"
  file_permission = "0400"
}