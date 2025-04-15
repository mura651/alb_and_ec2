locals {
  resource_name = "${var.name_prefix}-rt"
  common_tags = {
    "Name"        = local.resource_name
    "Environment" = var.env
    "Application" = var.app_name
  }
} 