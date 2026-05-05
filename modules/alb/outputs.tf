# OUTPUTS DO MÓDULO ALB
output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.app_tg.arn
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "alb_arn_suffix" {
  description = "ARN suffix do ALB para metricas CloudWatch"
  value       = aws_lb.app_alb.arn_suffix
}

output "target_group_arn_suffix" {
  description = "ARN suffix do Target Group para metricas CloudWatch"
  value       = aws_lb_target_group.app_tg.arn_suffix
}