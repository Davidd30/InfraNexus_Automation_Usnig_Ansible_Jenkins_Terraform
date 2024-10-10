output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.David_VPC.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.Public_Subnet.id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.ssh_http.id
}

output "public_subnet_cidr" {
  description = "CIDR block of the public subnet"
  value       = aws_subnet.Public_Subnet.cidr_block
}