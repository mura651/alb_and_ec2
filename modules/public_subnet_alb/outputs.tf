output "subnet_ids" {
  value = {
    "${var.name_prefix}-subnet-public-1a" = aws_subnet.sub_alb_pub_a.id
    "${var.name_prefix}-subnet-public-1c" = aws_subnet.sub_alb_pub_c.id
  }
}