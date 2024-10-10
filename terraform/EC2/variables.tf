variable "instance_type" {
  description = "Type of Instance"
  type        = string
  default     = "t2.medium"
}

variable "subnet_id" {
  description = "ID of subnet"
  type        = string
}

variable "security_group_id" {
  description = "ID of SG"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}