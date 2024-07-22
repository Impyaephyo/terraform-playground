output "vpc_id" {
  value = aws_vpc.lab_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets[*].id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.natgw.id
}

output "aws_internet_gateway_id" {
  value = aws_internet_gateway.labigw.id
}

output "aws_instance_public_ip" {
  value = aws_instance.bastion_host.public_ip
}

output "aws_instance_private_ip" {
  value = aws_instance.myprivate_instance.private_ip
}