output "rds_endpoint" {
  description = "Endpoint do RDS"
  value       = aws_db_instance.rds.endpoint
}

output "rds_master_user_secret_arn" {
  description = "ARN do secret gerenciado pelo RDS no Secrets Manager"
  value       = aws_db_instance.rds.master_user_secret[0].secret_arn
}