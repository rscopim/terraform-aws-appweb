# 🚀 Terraform-AppWeb — Arquitetura AWS com Terraform

Projeto de infraestrutura como código (IaC) utilizando Terraform para provisionar uma arquitetura completa, escalável e modular na AWS.

Este projeto demonstra, de ponta a ponta, a criação de uma aplicação web altamente disponível, com balanceamento de carga, auto scaling, banco de dados, backend remoto e separação de ambientes (DEV/PROD).

Esse projeto está em constante evolução.

---

## 🧠 Visão geral

A aplicação é exposta publicamente através de um Application Load Balancer e distribuída entre instâncias EC2 gerenciadas por um Auto Scaling Group.

A arquitetura utiliza subnets públicas e privadas, garantindo isolamento de rede, segurança e controle de custos.

O projeto também implementa backend remoto com S3 e DynamoDB, simulando ambiente real de equipe.

---

## 🏗️ Arquitetura

```text
Internet
   ↓
Application Load Balancer
   ↓
Auto Scaling Group (EC2 - Subnet privada)
   ↓
├── Amazon S3 (armazenamento)
└── Amazon RDS (banco de dados)
```

---

## ⚙️ Serviços utilizados

* Amazon VPC (rede isolada)
* Subnets públicas e privadas (Multi-AZ)
* Internet Gateway
* NAT Gateway (módulo separado)
* Elastic IP
* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* Amazon EC2
* Amazon S3
* Amazon RDS (MySQL)
* AWS IAM (roles e policies)
* Amazon DynamoDB (state lock)
* Terraform (Infraestrutura como código)

---

## 🔐 Segurança aplicada

* Instâncias EC2 em subnets privadas
* RDS sem acesso público
* Security Groups com acesso restrito
* IAM Role para acesso ao S3 (sem uso de credenciais)
* Separação entre camada pública e privada
* Backend remoto com controle de lock (DynamoDB)

---

## 📁 Estrutura do projeto

```text
AppWeb/
├── backend/                    # Infraestrutura do backend remoto (S3 + DynamoDB)
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│
├── docs/                       # Documentação por fases
│   ├── arquitetura/
│   ├── Fase_1_vpc/
│   ├── Fase_2_s3/
│   ├── Fase_3_iam/
│   ├── Fase_4_ec2/
│   ├── Fase_5_alb/
│   ├── Fase_6_asg/
│   ├── Fase_7_NAT/
│   ├── Fase_8_Integracao_S3/
│   ├── Fase_9_RDS/
│   ├── Fase_10_backend/
│   └── Fase_11_NatGateway/
│
├── examples/
│   └── ec2-standalone/
│
├── modules/
│   ├── alb/
│   ├── autoscaling/
│   ├── iam/
│   ├── nat/
│   ├── rds/
│   ├── s3/
│   ├── security-group/
│   └── vpc/
│
├── backend-dev.hcl             # Backend DEV
├── backend-prod.hcl            # Backend PROD
├── backend.tf                  # Configuração do backend remoto
│
├── dev.tfvars                  # Variáveis DEV
├── prod.tfvars                 # Variáveis PROD
│
├── main.tf
├── variables.tf
├── outputs.tf
├── locals.tf
│
├── README.md
├── LICENSE
└── .gitignore
```

---

## 🚀 Como executar o projeto

### 🌱 Ambiente DEV

```bash
terraform init -reconfigure -backend-config="backend-dev.hcl"
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

---

### 🏭 Ambiente PROD

```bash
terraform init -reconfigure -backend-config="backend-prod.hcl"
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
```

---

## 🌐 Acesso à aplicação

Após o deploy:

```bash
terraform output alb_dns_name
```

Acesse:

```text
http://<ALB_DNS_NAME>
```

---

## 🧪 Funcionalidades implementadas

* Página web dinâmica identificando a instância
* Integração com S3 (leitura/escrita)
* Auto Scaling funcional
* Balanceamento via ALB
* Banco RDS em subnet privada
* Backend remoto com lock
* Separação de ambientes (dev/prod)

---

## 💰 Controle de custos

### 🌱 DEV

```bash
terraform init -reconfigure -backend-config="backend-dev.hcl"

terraform destroy \
  -target="module.nat" \
  -target="module.autoscaling" \
  -target="module.alb" \
  -target="module.rds" \
  -var-file="dev.tfvars"
```

---

### 🏭 PROD

```bash
terraform init -reconfigure -backend-config="backend-prod.hcl"

terraform destroy \
  -target="module.nat" \
  -target="module.autoscaling" \
  -target="module.alb" \
  -target="module.rds" \
  -var-file="prod.tfvars"
```

---

### 🔒 Recursos mantidos

* VPC
* Subnets
* IAM
* Security Groups
* S3 (baixo custo)
* Backend remoto (S3 + DynamoDB)

---

## 📈 Evolução do projeto

* Fase 1 — VPC
* Fase 2 — S3
* Fase 3 — IAM
* Fase 4 — EC2
* Fase 5 — ALB
* Fase 6 — Auto Scaling
* Fase 7 — NAT Gateway
* Fase 8 — Integração S3
* Fase 9 — RDS
* Fase 10 — Backend remoto (S3 + DynamoDB)
* Fase 11 — Módulo NAT Gateway

---

## 🧩 Próximas melhorias

* AWS Secrets Manager para credenciais
* CI/CD com GitHub Actions
* Monitoramento com CloudWatch
* Diagrama visual da arquitetura
* Multi-account AWS

---

## 👨‍💻 Autor

Projeto desenvolvido por Ricardo Simines Scopim
Instrutor de Cloud Computing (AWS)

---

## 📌 Observação

Este projeto foi desenvolvido com foco educacional e demonstra boas práticas de arquitetura em cloud, modularização com Terraform e padrões utilizados no mercado.

