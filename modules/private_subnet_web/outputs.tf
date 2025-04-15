output "private_subnet" {
  value = aws_subnet.private_subnet
}

output "subnet_ids" {
  value = {
    "${var.name_prefix}-subnet-private-1a" = aws_subnet.private_subnet.id
  }
}
