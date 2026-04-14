# 🚀 Terraform AWS AppWeb

Projeto de infraestrutura como código (IaC) utilizando **Terraform + AWS**, com foco em aprendizado prático e construção de uma arquitetura real de aplicação web.

---

## 🎯 Objetivo

Construir uma infraestrutura completa na AWS utilizando boas práticas de Terraform, incluindo:

* Rede (VPC)
* Armazenamento (S3)
* Controle de acesso (IAM)
* Computação (EC2)
* Escalabilidade (em fases futuras)

---

## 🏗️ Arquitetura (Atual)

* VPC com subnets públicas e privadas (Multi-AZ)
* Internet Gateway
* Bucket S3 com nome único
* IAM Role com acesso ao S3
* EC2 com servidor web (Apache)
* Integração EC2 → S3 via IAM

---

## 📁 Estrutura do Projeto

```text
.
├── modules/
│   ├── vpc/
│   ├── s3/
│   ├── iam/
│   └── ec2/
│
├── docs/
│   ├── vpc/
│   ├── s3/
│   ├── iam/
│   └── ec2/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
└── .gitignore
```

---

## 📅 Progresso do Projeto

* [x] Fase 1 — VPC (rede base)
* [x] Fase 2 — S3 + IAM (armazenamento e permissões)
* [x] Fase 3 — EC2 (servidor web com integração ao S3)
* [ ] Fase 4 — Load Balancer (ALB)
* [ ] Fase 5 — Auto Scaling
* [ ] Fase 6 — Arquitetura completa

---

## ⚙️ Pré-requisitos

Antes de executar o projeto, é necessário:

* Terraform instalado
* AWS CLI configurado
* Conta AWS ativa

---

## 🚀 Como executar

### 1. Inicializar o projeto

```bash
terraform init
```

---

### 2. Validar o código

```bash
terraform validate
```

---

### 3. Ver o plano de execução

```bash
terraform plan
```

---

### 4. Criar a infraestrutura

```bash
terraform apply
```

---

### 5. Ver outputs

```bash
terraform output
```

---

### 6. Acessar a aplicação

Após o `apply`, copie o IP público da EC2:

```bash
terraform output ec2_public_ip
```

E acesse no navegador:

```text
http://SEU_IP_PUBLICO
```

---

### 7. Destruir a infraestrutura (evitar custos)

```bash
terraform destroy
```

---

## 🧠 Conceitos aplicados

* Infraestrutura como código (IaC)
* Modularização com Terraform
* Uso de variáveis e outputs
* Data sources (AMI dinâmica)
* IAM Roles e Policies
* Integração segura entre serviços AWS

---

## 📚 Documentação

Cada fase está documentada em detalhes na pasta `docs/`.

### Links oficiais do Terraform:

* https://developer.hashicorp.com/terraform/docs
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs

---

## 🔒 Boas práticas aplicadas

* Uso de módulos reutilizáveis
* Separação de responsabilidades
* Naming convention padronizada
* `.gitignore` configurado corretamente
* Uso de IAM ao invés de access keys

---

## 💼 Sobre o projeto

Este projeto foi desenvolvido como parte de um plano de estudo prático para domínio de Terraform e AWS, com foco em cenários reais de mercado.

---

## 🚀 Próximos passos

* Application Load Balancer (ALB)
* Auto Scaling Group
* Deploy automatizado
* Integração com CI/CD
