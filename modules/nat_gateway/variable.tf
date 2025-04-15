variable "public_subnet_id" {
  type = string
  description = "Public subnet ID where NAT Gateway will be placed"
}

variable "name_prefix" {
  type = string
  description = "Prefix for resource names"
}

variable "vpc_id" {
  type = string
  description = "VPC ID where NAT Gateway will be placed"
}

variable "az" {
  type = string
  description = "Availability Zone where NAT Gateway will be placed"
}