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
