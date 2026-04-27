# 🚀 Terraform-AppWeb — Arquitetura AWS com Terraform

Projeto de infraestrutura como código (IaC) utilizando Terraform para provisionar uma arquitetura completa e escalável na AWS.

Este projeto demonstra, de ponta a ponta, a criação de uma aplicação web altamente disponível, com balanceamento de carga, auto scaling, banco de dados e integração com serviços gerenciados.

Esse projeto está em constante evolução.

---

## 🧠 Visão geral

A aplicação é exposta publicamente através de um Application Load Balancer e distribuída entre instâncias EC2 gerenciadas por um Auto Scaling Group.

A arquitetura utiliza subnets públicas e privadas, garantindo isolamento de rede e segurança.

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
* NAT Gateway
* Elastic IP
* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* Amazon EC2
* Amazon S3
* Amazon RDS (MySQL)
* AWS IAM (roles e policies)
* Terraform (Infraestrutura como código)

---

## 🔐 Segurança aplicada

* Instâncias EC2 em subnets privadas
* RDS sem acesso público
* Security Groups com acesso restrito
* IAM Role para acesso ao S3 (sem uso de credenciais)
* Separação entre camada pública e privada

---

## 📁 Estrutura do projeto

```text
.
├── main.tf
├── variables.tf
├── outputs.tf
├── locals.tf
│
├── modules/
│   ├── vpc/
│   ├── alb/
│   ├── autoscaling/
│   ├── iam/
│   ├── rds/
│   ├── s3/
│   └── security-group/
│
├── docs/
│   ├── arquitetura/
│   │   ├── arquitetura_atual.md
│   │   └── evolucao.md
│   │
│   ├── Fase_1_vpc/
│   ├── Fase_2_s3/
│   ├── Fase_3_iam/
│   ├── Fase_4_ec2/
│   ├── Fase_5_alb/
│   ├── Fase_6_asg/
│   ├── Fase_7_NAT/
│   ├── Fase_8_Integracao_S3/
│   └── Fase_9_RDS/
│
├── examples/
│   └── ec2-standalone/
│       └── module-ec2-legacy/
│
├── .gitignore
├── .terraform.lock.hcl
├── LICENSE
└── README.md
```

```

---

## 🚀 Como executar o projeto

### 1. Inicializar Terraform

```bash
terraform init
```

### 2. Validar configuração

```bash
terraform validate
```

### 3. Visualizar plano

```bash
terraform plan
```

### 4. Aplicar infraestrutura

```bash
terraform apply
```

---

## 🌐 Acesso à aplicação

Após o deploy:

```bash
terraform output alb_dns_name
```

Acesse no navegador:

```text
http://<ALB_DNS_NAME>
```

---

## 🧪 Funcionalidades implementadas

* Página web dinâmica identificando a instância
* Integração com S3 (leitura/escrita de dados)
* Auto Scaling funcional
* Balanceamento de carga via ALB
* Banco RDS provisionado em subnet privada

---

## 💰 Controle de custos

O projeto permite destruir apenas componentes com custo:

```bash
terraform destroy -target="module.autoscaling"
terraform destroy -target="module.alb"
terraform destroy -target="module.vpc.aws_nat_gateway.nat" -target="module.vpc.aws_eip.nat"
terraform destroy -target="module.rds"
```

Mantendo:

* VPC
* IAM
* S3

---

## 📈 Evolução do projeto

O projeto foi construído por fases:

* Fase 1 — VPC
* Fase 2 — S3 + IAM
* Fase 3 — EC2
* Fase 4 — ALB
* Fase 5 — Auto Scaling
* Fase 6 — NAT Gateway
* Fase 7 — Aplicação Web
* Fase 8 — Integração com S3
* Fase 9 — RDS

---

## 🧩 Próximas melhorias

* Uso de AWS Secrets Manager para credenciais
* Backend remoto Terraform (S3 + DynamoDB)
* CI/CD com GitHub Actions
* Monitoramento com CloudWatch
* Diagrama visual da arquitetura

---

## 👨‍💻 Autor

Projeto desenvolvido por Ricardo Simines Scopim
Instrutor de Cloud Computing (AWS)

---

## 📌 Observação

Este projeto foi desenvolvido com foco educacional e demonstra boas práticas de arquitetura em cloud utilizando Terraform.
