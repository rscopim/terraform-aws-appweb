# VARIÁVEIS GLOBAIS DO PROJETO
variable "aws_region" {
  description = "Regiao AWS"
  type        = string
}
variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

# REGIÃO AWS
variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
}

variable "public_subnets" {
  description = "Lista de subnets publicas"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de subnets privadas"
  type        = list(string)
}

variable "azs" {
  description = "Lista de Availability Zones"
  type        = list(string)
}

# COMPUTAÇÃO
variable "instance_type" {
  description = "Tipo da instancia EC2"
  type        = string
}

# AUTOSCALING
# Capacidade mínima
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

# CloudWatch
variable "log_retention_days" {
  description = "Quantidade de dias para reter logs no CloudWatch"
  type        = number
}

# TAGS
variable "tags" {
  description = "Tags padrao dos recursos"
  type        = map(string)
}

variable "linkedin_url" {
  description = "URL do LinkedIn"
  type        = string
}

variable "github_url" {
  description = "URL do GitHub"
  type        = string
}

variable "db_username" {
  description = "Usuario administrador do banco"
  type        = string
}
