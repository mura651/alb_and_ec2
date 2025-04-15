resource "aws_vpc" "this" {
  enable_dns_hostnames = true
  enable_dns_support = true
  cidr_block = var.cidr_block
  tags = local.common_tags
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = local.common_tags
}