resource "aws_vpc" "David_VPC" {
  cidr_block           = var.cidr_block

  tags = {
    Name = "David_VPC"
    createdby = "David Nabil"
  }
}

resource "aws_internet_gateway" "David_VPC_IGW" {
  vpc_id = aws_vpc.David_VPC.id

  tags = {
    Name = "David_VPC_IGW"
    createdby = "David Nabil"
  }
}

resource "aws_subnet" "Public_Subnet" {
  vpc_id            = aws_vpc.David_VPC.id
  cidr_block        = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = var.availability_zone

  tags = {
    Name = "David_VPC_Public_Subnet"
  }
}

resource "aws_route_table" "Public_RT" {
  vpc_id = aws_vpc.David_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.David_VPC_IGW.id
  }

  tags = {
    Name = "David_VPC_Public_RT"
  }
}

resource "aws_route_table_association" "public_associate" {
  subnet_id      = aws_subnet.Public_Subnet.id
  route_table_id = aws_route_table.Public_RT.id
}

resource "aws_security_group" "ssh_http" {
  name        = "David_VPC_SG"
  vpc_id      = aws_vpc.David_VPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "David_VPC_SG"
  }
}