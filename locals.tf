# PADRONIZAÇÃO GLOBAL DE NOMES
locals {
  # Nome visual usado em tags
  project_display_name = var.project_name

  # Nome técnico usado em recursos com regras rígidas
  project_name_safe = replace(lower(var.project_name), "/[^a-z0-9-]/", "-")

  # Tags padrão do projeto
  common_tags = {
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Environment = "Prod"
  }
}