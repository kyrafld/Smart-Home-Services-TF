variable "vpc_id"{
    type = string
}

variable "instance_id" {
    type = list(string)
}
variable "security_group_id" {
  type        = list(string)
  description = "A list of security group IDs to apply to the instances"
}

variable "public_subnets" {
  type = list(string)
}

variable "path" {
  type = list(string)
}

variable "service_names" {
  type    = list(string)
}
