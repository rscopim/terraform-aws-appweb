# OUTPUTS DA RAIZ
output "ec2_public_ip" {
  value = module.ec2.public_ip
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