resource "aws_instance" "this" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [var.security_group_id]
    associate_public_ip_address = true
    subnet_id = var.subnet_id
    user_data = file("${path.module}/init.sh")
    tags = local.common_tags
}

