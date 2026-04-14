# Fase 1 — VPC (Base da infraestrutura)

## 🎯 Objetivo

Criar a base da infraestrutura na AWS com uma VPC multi-AZ, separando subnets públicas e privadas.

## 🏗️ O que foi criado

* VPC
* Internet Gateway
* Subnets públicas (2 AZs)
* Subnets privadas (2 AZs)
* Route Table pública

## 🧠 Conceitos importantes

* VPC: rede isolada na AWS
* Subnet pública: acesso à internet
* Subnet privada: sem acesso direto
* Multi-AZ: alta disponibilidade

## ⚙️ Como funciona

A VPC foi criada com CIDR 10.0.0.0/16, dividida em subnets públicas e privadas distribuídas em duas Availability Zones.

As subnets públicas estão associadas a uma route table com acesso ao Internet Gateway.

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

## 🧪 Como testar

* Verificar VPC no console AWS
* Validar subnets nas AZs
* Conferir route table
