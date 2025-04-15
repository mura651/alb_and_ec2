resource "aws_subnet" "sub_alb_pub_a" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block_a
  availability_zone = var.availability_zone_a
  tags = local.common_tags
}

resource "aws_subnet" "sub_alb_pub_c" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block_c
  availability_zone = var.availability_zone_c
  tags = local.common_tags
}

resource "aws_route_table_association" "alb_pub_a" {
  subnet_id = aws_subnet.sub_alb_pub_a.id
  route_table_id = var.route_table_id
}

resource "aws_route_table_association" "alb_pub_c" {
  subnet_id = aws_subnet.sub_alb_pub_c.id
  route_table_id = var.route_table_id
}