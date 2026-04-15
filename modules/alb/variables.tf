# VARIÁVEIS DO MÓDULO ALB

# Nome do projeto
# Para que serve:
# - padronizar nomes dos recursos
variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

# ID da VPC
# Para que serve:
# - criar recursos de rede dentro da VPC correta
variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

# Lista de subnets públicas
# Para que serve:
# - colocar o ALB em múltiplas AZs
variable "public_subnet_ids" {
  description = "Lista de subnets publicas"
  type        = list(string)
}
