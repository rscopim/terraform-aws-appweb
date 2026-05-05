# OUTPUTS DO MÓDULO AUTOSCALING
output "launch_template_id" {
  value = aws_launch_template.app_lt.id
}

output "autoscaling_group_name" {
  description = "Nome do Auto Scaling Group"
  value       = aws_autoscaling_group.app_asg.name
}