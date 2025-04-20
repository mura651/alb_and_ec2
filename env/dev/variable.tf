variable "app_name" {
  type = string
}

variable "env" {
  type = string
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "key_name" {
  type = string
}

# Subnet CIDR variables
variable "public_subnet_1a_cidr" {
  type = string
}

variable "public_subnet_1c_cidr" {
  type = string
}

variable "private_subnet_web_1a_cidr" {
  type = string
}

variable "private_subnet_web_1c_cidr" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}