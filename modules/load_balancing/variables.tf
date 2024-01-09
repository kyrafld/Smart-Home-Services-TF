variable "vpc_id" {
  type = string
}

variable "instance_id" {
  type = list(string)
}

variable "security_group_id" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "path" {
  type = list(string)
}

variable "service_names" {
  type = list(string)
}
