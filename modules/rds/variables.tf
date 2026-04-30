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

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "app_security_group_id" {
  type = string
}

variable "db_username" {
  description = "Usuario administrador do banco"
  type        = string
}