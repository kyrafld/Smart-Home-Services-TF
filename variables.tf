variable "public_subnets" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the private subnets"
}

variable "azs" {
  type        = list(string)
  description = "A list of the Availability Zones you wish to provision infrastructure in"
}

variable "instance_type" {
  type = string
}

variable "service_names" {
  type = list(string)
}


variable "key_name" {
  type = string
}

variable "path" {
  type = list(string)
}
