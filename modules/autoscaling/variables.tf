variable "ami_img" {
  type = list(string)
}

variable "instance_type" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "security_group_id" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "load_balancing" {
  type = list(string)
}

variable "service_names" {
  type = list(string)
}
