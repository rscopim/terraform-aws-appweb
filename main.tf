# PROVIDER
provider "aws" {
  region = var.aws_region
}

# VPC
module "vpc" {
  source            = "./modules/vpc"
  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags
  vpc_cidr          = var.vpc_cidr
  public_subnets    = var.public_subnets
  private_subnets   = var.private_subnets
  azs               = var.azs
}

# NAT
module "nat" {
  source = "./modules/nat"

  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags

  public_subnet_id       = module.vpc.public_subnets[0]
  private_route_table_id = module.vpc.private_route_table_id
  internet_gateway_id    = module.vpc.internet_gateway_id
}

# S3
module "s3" {
  source            = "./modules/s3"
  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags
}
# IAM
module "iam" {
  source            = "./modules/iam"
  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags
  bucket_name       = module.s3.bucket_name
  rds_secret_arn    = module.rds.rds_master_user_secret_arn
}
# MÓDULO ALB
module "alb" {
  source            = "./modules/alb"
  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnets
}
# MÓDULO SECURITY GROUP DA APP
module "sg" {
  source                = "./modules/security-group"
  project_name          = local.project_display_name
  project_name_safe     = local.project_name_safe
  common_tags           = local.common_tags
  vpc_id                = module.vpc.vpc_id
  alb_security_group_id = module.alb.alb_sg_id
}
# MÓDULO AUTOSCALING
module "autoscaling" {
  source                = "./modules/autoscaling"
  project_name          = local.project_display_name
  project_name_safe     = local.project_name_safe
  common_tags           = local.common_tags
  private_subnet_ids    = module.vpc.private_subnets
  target_group_arn      = module.alb.target_group_arn
  instance_profile_name = module.iam.instance_profile
  security_group_id     = module.sg.security_group_id
  rds_secret_arn        = module.rds.rds_master_user_secret_arn
  bucket_name           = module.s3.bucket_name
  instance_type         = var.instance_type
  asg_min_size          = var.asg_min_size
  asg_desired_capacity  = var.asg_desired_capacity
  asg_max_size          = var.asg_max_size
  linkedin_url          = var.linkedin_url
  github_url            = var.github_url
}

module "rds" {
  source                = "./modules/rds"
  project_name          = local.project_display_name
  project_name_safe     = local.project_name_safe
  common_tags           = local.common_tags
  subnet_ids            = module.vpc.private_subnets
  vpc_id                = module.vpc.vpc_id
  app_security_group_id = module.sg.security_group_id
  db_username           = var.db_username
}