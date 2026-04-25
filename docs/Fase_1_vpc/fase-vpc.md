# Fase 1 — VPC (Base da infraestrutura)

## 🎯 Objetivo

Criar a base da infraestrutura na AWS utilizando uma VPC distribuída em múltiplas Availability Zones (Multi-AZ), com separação entre subnets públicas e privadas.

---

## 🏗️ O que foi criado

* VPC (Virtual Private Cloud)
* Internet Gateway
* Subnets públicas (distribuídas em 2 AZs)
* Subnets privadas (distribuídas em 2 AZs)
* Route Table pública associada às subnets públicas

---

## 🧠 Conceitos importantes

* **VPC (Virtual Private Cloud)**: rede virtual isolada dentro da AWS, onde todos os recursos são provisionados
* **Subnet pública**: possui rota para a internet via Internet Gateway
* **Subnet privada**: não possui acesso direto à internet
* **Internet Gateway (IGW)**: componente que permite comunicação entre a VPC e a internet
* **Multi-AZ**: distribuição de recursos em múltiplas zonas de disponibilidade, aumentando a resiliência da aplicação

---

## ⚙️ Como funciona

A VPC foi criada com o bloco CIDR `10.0.0.0/16`, sendo segmentada em subnets públicas e privadas.

As subnets públicas estão associadas a uma Route Table com uma rota padrão (`0.0.0.0/0`) apontando para o Internet Gateway, permitindo acesso à internet.

As subnets privadas não possuem rota direta para a internet, garantindo maior isolamento e segurança para os recursos que serão provisionados nelas nas próximas fases.

Fluxo de rede:

```text
Internet
   ↓
Internet Gateway
   ↓
Subnets públicas
   ↓
(Subnets privadas sem acesso direto)
```

---

## 🔐 Segurança aplicada

* Separação entre camadas pública e privada
* Recursos críticos serão implantados em subnets privadas
* Controle de acesso à internet centralizado via Internet Gateway

---

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

---

## 🧪 Como testar

* Verificar a VPC criada no console AWS
* Validar se as subnets estão distribuídas em diferentes AZs
* Confirmar associação da Route Table pública às subnets públicas
* Validar a presença do Internet Gateway associado à VPC

---

## 📌 Observações importantes

* Esta fase define a base da arquitetura — todas as fases seguintes dependem dessa estrutura
* A separação entre subnets públicas e privadas é essencial para segurança em ambientes reais
* O acesso à internet será expandido nas próximas fases com o uso de NAT Gateway

---

## 🚀 Evolução futura

* Implementação de NAT Gateway para permitir saída de internet a partir das subnets privadas
* Criação de regras de segurança mais específicas com Security Groups e NACLs
* Integração com recursos como EC2, ALB e RDS dentro da VPC

---

