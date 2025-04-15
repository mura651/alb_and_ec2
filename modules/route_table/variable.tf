# 基本変数
variable "name_prefix" {
  type = string
}

# リソースID参照
variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type = string
}

variable "nat_gateway_id" {
  type = string
}

variable "env" {
  type = string
}

variable "app_name" {
  type = string
}