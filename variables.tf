# VARIÁVEIS GLOBAIS DO PROJETO

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "Terraform-AppWeb"
}

# REGIÃO AWS
variable "aws_region" {
  description = "Regiao AWS"
  type        = string
  default     = "us-west-2"
}

# REDE (VPC)
variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Subnets públicas
variable "public_subnets" {
  description = "Lista de subnets publicas"
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

# Subnets privadas
variable "private_subnets" {
  description = "Lista de subnets privadas"
  type        = list(string)
  default = [
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]
}

# Availability Zones
variable "azs" {
  description = "Lista de AZs"
  type        = list(string)
  default = [
    "us-west-2a",
    "us-west-2b"
  ]
}

# COMPUTAÇÃO
variable "instance_type" {
  description = "Tipo da instancia EC2"
  type        = string
  default     = "t2.micro"
}

# AUTOSCALING
# Capacidade mínima
variable "asg_min_size" {
  description = "Quantidade minima de instancias"
  type        = number
  default     = 2
}

# Capacidade desejada
variable "asg_desired_capacity" {
  description = "Quantidade desejada de instancias"
  type        = number
  default     = 2
}

# Capacidade máxima
variable "asg_max_size" {
  description = "Quantidade maxima de instancias"
  type        = number
  default     = 4
}

# TAGS
variable "tags" {
  description = "Tags padrao dos recursos"
  type        = map(string)

  default = {
    Project     = "Terraform-AppWeb"
    Environment = "Lab"
  }
}
