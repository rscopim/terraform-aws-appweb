# VARIÁVEIS DO MÓDULO AUTOSCALING

variable "project_name" {
  description = "Nome do projeto"
  type        = string
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