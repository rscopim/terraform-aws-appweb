# Fase 11 — Módulo NAT Gateway

## 🎯 Objetivo

Separar o NAT Gateway em um módulo próprio para melhorar a organização da arquitetura e permitir controle de custo.

## 🏗️ O que foi criado

* Módulo `nat`
* Elastic IP
* NAT Gateway
* Rota privada para internet via NAT

## 🧠 Conceitos importantes

* NAT Gateway: permite saída para internet a partir de subnets privadas
* Elastic IP: IP público fixo associado ao NAT
* Route Table privada: recebe a rota padrão para saída via NAT
* Separação de responsabilidades: VPC e NAT ficam em módulos distintos

## ⚙️ Como funciona

O módulo VPC cria a rede base, incluindo subnets e route tables.

O módulo NAT recebe a subnet pública, a route table privada e cria a rota `0.0.0.0/0` para permitir saída de internet das subnets privadas.

## 🔐 Segurança aplicada

* Instâncias privadas continuam sem IP público
* NAT permite apenas tráfego de saída
* A VPC permanece separada do recurso que gera custo

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route

## 🧪 Como testar

* Rodar `terraform plan -var-file="dev.tfvars"`
* Rodar `terraform apply -var-file="dev.tfvars"`
* Validar o NAT Gateway no console AWS
* Conferir a rota `0.0.0.0/0` na route table privada

## 📌 Observações importantes

* NAT Gateway gera custo
* O módulo pode ser destruído separadamente com `terraform destroy -target="module.nat"`
* Se o NAT for destruído, instâncias privadas perdem saída para internet

## 🚀 Evolução futura

* Criar NAT Gateway por AZ para maior disponibilidade
* Usar VPC Endpoints para reduzir dependência do NAT
* Controlar criação do NAT por variável