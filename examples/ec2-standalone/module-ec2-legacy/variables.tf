# VARIÁVEIS DO MÓDULO EC2

variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "subnet_id" {
  description = "ID da subnet onde a EC2 será criada"
  type        = string
}

variable "instance_profile_name" {
  description = "Nome do IAM Instance Profile da EC2"
  type        = string
}

variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância"
  type        = string
  default     = "t3.micro"
}