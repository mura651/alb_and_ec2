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

variable "cidr_block_a" {
  type = string
}

variable "cidr_block_c" {
  type = string
}

variable "availability_zone_a" {
  type = string
  default = "ap-northeast-1a"
}

variable "availability_zone_c" {
  type = string
  default = "ap-northeast-1c"
}

variable "tags" {
  type = map(string)
  default = {}
}
