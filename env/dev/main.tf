locals {
  name_prefix = "${var.app_name}-${var.env}"
  common_tags = {
    "Name"        = local.name_prefix
    "Environment" = var.env
    "Application" = var.app_name
  }
}

# 基本インフラ
module "vpc" {
  source      = "../../modules/vpc"
  cidr_block  = var.vpc_cidr
  name_prefix = local.name_prefix
  env         = var.env
  app_name    = var.app_name
  vpc_name    = "${local.name_prefix}-vpc"
  igw_name    = "${local.name_prefix}-igw"
  tags        = local.common_tags
}

module "route_table" {
  source         = "../../modules/route_table"
  vpc_id         = module.vpc.vpc_id
  igw_id         = module.vpc.igw_id
  nat_gateway_id = module.nat_gateway.nat_gateway_id
  name_prefix    = local.name_prefix
  env            = var.env
  app_name       = var.app_name
}

# パブリック側
module "public_subnet_alb_1a" {
  source            = "../../modules/public_subnet_alb"
  vpc_id            = module.vpc.vpc_id
  name_prefix       = local.name_prefix
  env               = var.env
  app_name          = var.app_name
  route_table_id    = module.route_table.public_route_table_id
  cidr_block        = var.public_subnet_1a_cidr
  availability_zone = "ap-northeast-1a"
  az_suffix         = "1a"
}

module "public_subnet_alb_1c" {
  source            = "../../modules/public_subnet_alb"
  vpc_id            = module.vpc.vpc_id
  name_prefix       = local.name_prefix
  env               = var.env
  app_name          = var.app_name
  route_table_id    = module.route_table.public_route_table_id
  cidr_block        = var.public_subnet_1c_cidr
  availability_zone = "ap-northeast-1c"
  az_suffix         = "1c"
}

module "nat_gateway" {
  source           = "../../modules/nat_gateway"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.public_subnet_alb_1a.subnet_id
  name_prefix      = local.name_prefix
  az               = "ap-northeast-1a"
}

# プライベート側
module "private_subnet_web_1a" {
  source            = "../../modules/private_subnet_web"
  vpc_id            = module.vpc.vpc_id
  name_prefix       = local.name_prefix
  env               = var.env
  app_name          = var.app_name
  cidr_block        = var.private_subnet_web_1a_cidr
  availability_zone = "ap-northeast-1a"
  az_suffix         = "1a"
  route_table_id    = module.route_table.private_route_table_id
}

module "private_subnet_web_1c" {
  source            = "../../modules/private_subnet_web"
  vpc_id            = module.vpc.vpc_id
  name_prefix       = local.name_prefix
  env               = var.env
  app_name          = var.app_name
  cidr_block        = var.private_subnet_web_1c_cidr
  availability_zone = "ap-northeast-1c"
  az_suffix         = "1c"
  route_table_id    = module.route_table.private_route_table_id
}

# セキュリティとアプリケーション
module "sec_grp" {
  source      = "../../modules/sec_grp"
  vpc_id      = module.vpc.vpc_id
  name_prefix = local.name_prefix
  env         = var.env
}

module "web" {
  source = "../../modules/web"

  name_prefix = local.name_prefix
  env         = var.env
  app_name    = var.app_name
  vpc_id      = module.vpc.vpc_id
  key_name    = var.key_name

  subnet_id         = module.private_subnet_web_1a.subnet_id
  security_group_id = module.sec_grp.web_sg_id
  ami_id            = var.ami_id
  instance_type     = var.instance_type
}

module "alb" {
  source            = "../../modules/alb"
  vpc_id            = module.vpc.vpc_id
  name_prefix       = local.name_prefix
  env               = var.env
  app_name          = var.app_name
  web_instance_id   = module.web.instance_id
  subnet_ids        = [
    module.public_subnet_alb_1a.subnet_id,
    module.public_subnet_alb_1c.subnet_id
  ]
  alb_sg_id         = module.sec_grp.alb_sg_id
  alb_name          = "${local.name_prefix}-alb"
  target_group_name = "${local.name_prefix}-web-tg"
  tags              = local.common_tags
}