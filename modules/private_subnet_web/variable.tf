# 基本変数
variable "name_prefix" {
  type = string
}

variable "app_name" {
  type = string
}

variable "env" {
  type = string
}

# リソースID参照
variable "vpc_id" {
  type = string
}

variable "route_table_id" {
  type = string
}

# ネットワーク設定
variable "availability_zone" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}