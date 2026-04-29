output "state_bucket_name" {
  description = "Nome do bucket S3 do Terraform state"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "lock_table_name" {
  description = "Nome da tabela DynamoDB de lock"
  value       = aws_dynamodb_table.terraform_lock.name
}