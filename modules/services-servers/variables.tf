variable "instance_type" {
  type = string
}

variable "service_names" {
  type = list(string)

}

variable "public_subnets" {
  type = list(string)
}

variable "security_group_id" {
  type        = list(string)
  description = "A list of security group IDs to apply to the instances"
}

variable "key_name" {
  type = string
}

variable "ami_img" {
  type = list(string)
}
