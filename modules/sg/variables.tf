# VARIÁVEIS DO MÓDULO SECURITY GROUP

variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "alb_security_group_id" {
  description = "ID do Security Group do ALB"
  type        = string
}