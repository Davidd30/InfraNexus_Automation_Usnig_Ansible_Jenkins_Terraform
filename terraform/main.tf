module "VPC" {
  source             = "./VPC"
  cidr_block         = var.vpc_cidr
  vpc_name           = var.vpc_name
  public_subnet_cidr = var.public_subnets
  availability_zone  = var.availability_zone
}

module "My_EC2_Instance" {
  source             = "../EC2"
  instance_type      = var.instance_type
  public_subnet_id   = module.My_VPC_Instance.public_subnet_id
  security_group_id  = module.My_VPC_Instance.security_group_id
  key_name           = var.key_name
}
