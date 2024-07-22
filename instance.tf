resource "aws_instance" "bastion_host" {
  #count         = length(var.public_subnet_cidrs)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnets[1].id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sshallow.id]
  associate_public_ip_address = true
  tags = {
    Name = "bastion_host"
  }
}

resource "aws_instance" "myprivate_instance" {
  #count         = length(var.private_subnet_cidrs)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_subnets[0].id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sshallow.id]
  associate_public_ip_address = false
  tags = {
    Name = "myprivate_instance"
  }
}