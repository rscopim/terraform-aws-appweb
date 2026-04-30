variable "bucket_name" {
  description = "Nome do bucket S3 da aplicação"
  type        = string
}

variable "project_name" {
  description = "Nome visual do projeto"
  type        = string
}

variable "project_name_safe" {
  description = "Nome tecnico do projeto"
  type        = string
}

variable "common_tags" {
  description = "Tags padrao"
  type        = map(string)
}

variable "rds_secret_arn" {
  description = "ARN do secret do RDS no Secrets Manager"
  type        = string
}