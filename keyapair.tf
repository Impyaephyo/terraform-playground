provider "tls" {}

resource "tls_private_key" "KP-Prodkey" {
  algorithm = "RSA"
}

resource "aws_key_pair" "KP-Prod" {
  key_name   = "KP-Lab"
  public_key = tls_private_key.KP-Prodkey.public_key_openssh
}

provider "local" {}

resource "local_file" "key" {
  content  = tls_private_key.KP-Prodkey.private_key_pem
  filename = "KP-Lab.pem"
}