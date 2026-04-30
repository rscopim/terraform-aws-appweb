# VARIÁVEIS DO MÓDULO AUTOSCALING

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

variable "private_subnet_ids" {
  description = "Lista de subnets privadas"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN do target group do ALB"
  type        = string
}

variable "instance_profile_name" {
  description = "Nome do instance profile"
  type        = string
}

variable "security_group_id" {
  description = "Security Group das instancias EC2"
  type        = string
}

variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instancia"
  type        = string
  default     = "t3.micro"
}

variable "asg_min_size" {
  description = "Quantidade minima de instancias"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Quantidade desejada de instancias"
  type        = number
}

variable "asg_max_size" {
  description = "Quantidade maxima de instancias"
  type        = number
}

variable "linkedin_url" {
  description = "URL do LinkedIn"
  type        = string
}

variable "github_url" {
  description = "URL do GitHub"
  type        = string
}

variable "rds_secret_arn" {
  description = "ARN do secret do RDS no Secrets Manager"
  type        = string
}