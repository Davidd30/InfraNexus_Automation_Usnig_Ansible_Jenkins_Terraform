resource "aws_instance" "David_EC2" {
  ami                    = "ami-0fff1b9a61dec8a5f"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "David_EC2"
    createdby = "David Nabil"
  }
}