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

variable "ami_img" {
  type        = list(string)
  description = "A list of the Amazon Machine Images(AMI)"
}

variable "instance_type" {
  type        = string
  description = "The type of instance to be applied "
}

variable "service_names" {
  type        = list(string)
  description = "A list of the different services names to apply to each server"
}

variable "key_name" {
  type        = string
  description = "The key_name available to access the servers "
}

variable "path" {
  type        = list(string)
  description = "A list of the different paths"
}

variable "desired_capacity" {
  type        = number
  description = "The desired capacity for autoscaling groups"
}

variable "min_size" {
  type        = number
  description = "The desired minium size for autoscaling groups "
}

variable "max_size" {
  type        = number
  description = "The desired maxium size for autoscaling groups "
}
