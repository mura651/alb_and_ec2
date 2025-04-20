locals {
  resource_name = "${var.name_prefix}-private-subnet-web-${var.az_suffix}"
  common_tags = {
    Name = local.resource_name
    Environment = var.env
    Application = var.app_name
  }
}
