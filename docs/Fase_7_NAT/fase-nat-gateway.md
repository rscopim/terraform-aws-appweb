# Fase 6 — NAT Gateway e rotas privadas

## 🎯 Objetivo

Permitir que instâncias em subnets privadas tenham saída para a internet sem ficarem expostas publicamente.

## 🏗️ O que foi criado

* Elastic IP
* NAT Gateway
* Route Table privada
* Rota privada para internet via NAT
* Associação das subnets privadas à route table privada

## 🧠 Conceitos importantes

* NAT Gateway: permite saída para internet de instâncias privadas
* Elastic IP: IP público fixo do NAT
* Route Table privada: controla o tráfego das subnets privadas
* Subnet privada: sem acesso direto da internet

## ⚙️ Como funciona

O NAT Gateway é criado em uma subnet pública e recebe um Elastic IP. As subnets privadas passam a usar uma route table própria com rota de saída para o NAT Gateway.

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

## 🧪 Como testar

* Rodar `terraform plan`
* Rodar `terraform apply`
* Validar no console AWS o NAT Gateway e a route table privada
