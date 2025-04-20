variable "vpc_id" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "env" {
  type = string
}

variable "app_name" {
  type = string
}

variable "route_table_id" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "az_suffix" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "availability_zone" {
  type = string
}