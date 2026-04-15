# PROVIDER
provider "aws" {
  region = "us-west-2"
}
# VARIÁVEL GLOBAL
variable "project_name" {
  default = "Terraform-AppWeb"
}
# VPC
module "vpc" {
  source = "./modules/vpc"
}
# S3
module "s3" {
  source       = "./modules/s3"
  project_name = var.project_name
}
# IAM
module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}
# MÓDULO EC2
module "ec2" {
  source = "./modules/ec2"

  project_name          = var.project_name
  vpc_id                = module.vpc.vpc_id
  subnet_id             = module.vpc.public_subnets[0]
  instance_profile_name = module.iam.instance_profile
  bucket_name           = module.s3.bucket_name
  instance_type         = "t3.micro"
}
# MÓDULO ALB
module "alb" {
  source = "./modules/alb"

  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnets
}
# MÓDULO AUTOSCALING
module "autoscaling" {
  source = "./modules/asg"

  project_name          = var.project_name
  private_subnet_ids    = module.vpc.public_subnets
  target_group_arn      = module.alb.target_group_arn
  instance_profile_name = module.iam.instance_profile
  security_group_id     = module.ec2.security_group_id
  bucket_name           = module.s3.bucket_name
  instance_type         = "t3.micro"
}