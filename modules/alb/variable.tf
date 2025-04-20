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
variable "alb_name" {
  type = string
  description = "Name of the ALB"
}

variable "target_group_name" {
  type = string
  description = "Name of the target group"
}

# リソースID参照
variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "web_instance_id" {
  type = string
}

# セキュリティ設定
variable "ingress_cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "alb_sg_id" {
  type = string
  description = "ID of the security group for the ALB"
}

# タグ設定
variable "tags" {
  type = map(string)
  description = "Tags to apply to all resources"
}