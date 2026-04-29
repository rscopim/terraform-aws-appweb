# OUTPUTS DA RAIZ
output "vpc_id" {
  description = "ID da VPC principal"
  value       = module.vpc.vpc_id
}

output "nat_gateway_id" {
  description = "ID do NAT Gateway"
  value       = module.nat.nat_gateway_id
}

output "nat_eip" {
  description = "Elastic IP do NAT Gateway"
  value       = module.nat.nat_eip
}

output "public_subnets" {
  description = "Lista de subnets publicas"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Lista de subnets privadas"
  value       = module.vpc.private_subnets
}

output "bucket_name" {
  description = "Nome do bucket S3"
  value       = module.s3.bucket_name
}

output "alb_dns_name" {
  description = "DNS publico do Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "autoscaling_group_name" {
  description = "Nome do Auto Scaling Group"
  value       = module.autoscaling.autoscaling_group_name
}

output "launch_template_id" {
  description = "ID do Launch Template"
  value       = module.autoscaling.launch_template_id
}