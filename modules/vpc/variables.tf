# VARIÁVEIS DA VPC
variable "vpc_cidr" {
  description = "CIDR da VPC"
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability Zones"
  default     = ["us-west-2a", "us-west-2b"]
}

variable "public_subnets" {
  description = "CIDR das subnets públicas"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "CIDR das subnets privadas"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

# IDENTIDADE DO PROJETO

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