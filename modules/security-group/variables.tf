# VARIÁVEIS DO MÓDULO SECURITY GROUP

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

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "alb_security_group_id" {
  description = "ID do Security Group do ALB"
  type        = string
}