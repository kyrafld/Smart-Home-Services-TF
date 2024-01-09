variable "service_names" {
  type = list(string)
}

variable "ami_img" {
  type = list(string)
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_group_id" {
  type = list(string)
}

variable "desired_capacity" {
  type = number
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "public_subnets_ids" {
  type = list(string)
}

variable "smart_home_tg_arns" {
  type = list(string)
}
