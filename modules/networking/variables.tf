variable "vpc_name" {
  type    = string
  default = "main_vpc"
}

variable "cidr_range" {
    type = string
    default = "10.0.0.0/16"
}

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
