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

# リソース名
variable "vpc_name" {
    type = string
    description = "Name of the VPC"
}

variable "igw_name" {
    type = string
    description = "Name of the Internet Gateway"
}

# ネットワーク設定
variable "cidr_block" {
    type = string
}

# タグ
variable "tags" {
    type = map(string)
    description = "Tags to apply to resources"
}