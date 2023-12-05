variable "instance_type" {
  type = string
}

variable "service_names" {
  type    = list(string)
  default = ["lighting", "heating", "status"]
}

variable "public_subnets" {
  type = list(string)
}

variable "security_group_id" {
  type        = list(string)
  description = "A list of security group IDs to apply to the instances"
}

variable  "database_names" {
type = list(string)
default = ["lighting", "heating"]
}
