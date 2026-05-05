output "topic_arn" {
  description = "ARN do topico SNS de alertas"
  value       = aws_sns_topic.alerts.arn
}

output "topic_name" {
  description = "Nome do topico SNS de alertas"
  value       = aws_sns_topic.alerts.name
}