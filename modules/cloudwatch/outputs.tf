output "log_group_name" {
  description = "Nome do CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.app.name
}

output "asg_cpu_alarm_name" {
  description = "Nome do alarme de CPU do ASG"
  value       = aws_cloudwatch_metric_alarm.asg_cpu_high.alarm_name
}

output "alb_5xx_alarm_name" {
  description = "Nome do alarme de erros 5XX do ALB"
  value       = aws_cloudwatch_metric_alarm.alb_5xx.alarm_name
}

output "target_unhealthy_alarm_name" {
  description = "Nome do alarme de targets nao saudaveis"
  value       = aws_cloudwatch_metric_alarm.target_unhealthy.alarm_name
}