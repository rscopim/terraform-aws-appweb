provider "aws" {
  region = var.aws_region
}

# VPC
module "vpc" {
  source = "./modules/vpc"

  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

# S3
module "s3" {
  source = "./modules/s3"

  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags
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

# ALB
module "alb" {
  source = "./modules/alb"

  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnets
}

# SECURITY GROUP DA APLICAÇÃO
module "sg" {
  source = "./modules/security-group"

  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags

  vpc_id                = module.vpc.vpc_id
  alb_security_group_id = module.alb.alb_sg_id
}

# RDS
module "rds" {
  source = "./modules/rds"

  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags

  subnet_ids            = module.vpc.private_subnets
  vpc_id                = module.vpc.vpc_id
  app_security_group_id = module.sg.security_group_id

  db_username = var.db_username
}

# IAM
module "iam" {
  source = "./modules/iam"

  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags

  bucket_name    = module.s3.bucket_name
  rds_secret_arn = module.rds.rds_master_user_secret_arn
}

# AUTOSCALING
module "autoscaling" {
  source = "./modules/autoscaling"

  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags

  private_subnet_ids        = module.vpc.private_subnets
  target_group_arn          = module.alb.target_group_arn
  instance_profile_name     = module.iam.instance_profile
  security_group_id         = module.sg.security_group_id
  rds_secret_arn            = module.rds.rds_master_user_secret_arn
  bucket_name               = module.s3.bucket_name
  cloudwatch_log_group_name = "/${local.project_name_safe}/app"

  instance_type        = var.instance_type
  asg_min_size         = var.asg_min_size
  asg_desired_capacity = var.asg_desired_capacity
  asg_max_size         = var.asg_max_size

  linkedin_url = var.linkedin_url
  github_url   = var.github_url
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags

  log_retention_days = var.log_retention_days

  autoscaling_group_name    = module.autoscaling.autoscaling_group_name
  alb_arn_suffix            = module.alb.alb_arn_suffix
  target_group_arn_suffix   = module.alb.target_group_arn_suffix
  cpu_alarm_threshold       = var.cpu_alarm_threshold
  unhealthy_hosts_threshold = var.unhealthy_hosts_threshold
  alb_5xx_threshold         = var.alb_5xx_threshold
  alarm_actions             = [module.sns.topic_arn]
  ok_actions                = [module.sns.topic_arn]
}

module "sns" {
  source = "./modules/sns"

  project_name      = local.project_display_name
  project_name_safe = local.project_name_safe
  common_tags       = local.common_tags

  alert_email = var.alert_email
}