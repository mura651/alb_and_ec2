app_name       = "myapp"
env            = "dev"
vpc_cidr       = "10.0.0.0/16"
key_name       = "my-key"

# Subnet CIDRs
public_subnet_1a_cidr      = "10.0.1.0/24"
public_subnet_1c_cidr      = "10.0.2.0/24"
private_subnet_web_1a_cidr   = "10.0.11.0/24"
private_subnet_web_1c_cidr   = "10.0.12.0/24"

ami_id        = "ami-0599b6e53ca798bb2"
instance_type = "t2.micro"