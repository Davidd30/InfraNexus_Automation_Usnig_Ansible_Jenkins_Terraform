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

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.David_EC2.public_ip
}

output "inventory_file" {
  description = "Ansible inventory file content"
  value       = <<EOT
      echo -e "[EC2] \n${aws_instance.David_EC2.public_ip}" >> inventory.ini
      EOT
}