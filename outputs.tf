# OUTPUTS DA RAIZ
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "bucket_name" {
  value = module.s3.bucket_name
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "autoscaling_group_name" {
  value = module.autoscaling.autoscaling_group_name
}

output "launch_template_id" {
  value = module.autoscaling.launch_template_id
}