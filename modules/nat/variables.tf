variable "project_name" {
  description = "Nome visual do projeto"
  type        = string
}

variable "project_name_safe" {
  description = "Nome tecnico seguro do projeto"
  type        = string
}

variable "common_tags" {
  description = "Tags padrao dos recursos"
  type        = map(string)
}

variable "public_subnet_id" {
  description = "ID da subnet publica onde o NAT Gateway sera criado"
  type        = string
}

variable "private_route_table_id" {
  description = "ID da route table privada"
  type        = string
}

variable "internet_gateway_id" {
  description = "ID do Internet Gateway"
  type        = string
}