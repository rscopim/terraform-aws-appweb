# 🚀 Terraform AWS AppWeb

Projeto de infraestrutura como código (IaC) utilizando **Terraform + AWS**, com foco em aprendizado prático e construção de uma arquitetura real de aplicação web.

---

## 🎯 Objetivo

Construir uma arquitetura AWS de forma progressiva, documentada e modular, evoluindo do básico para um cenário mais próximo de produção.

Este projeto foi criado com foco em:

* aprendizado prático de Terraform
* organização profissional de módulos
* documentação técnica da evolução da arquitetura
* construção de portfólio para GitHub

---

## 🏗️ Arquitetura atual

Atualmente, a arquitetura é composta por:

* VPC
* Subnets públicas e privadas
* Internet Gateway
* S3
* IAM
* Application Load Balancer (ALB)
* Security Group separado para a aplicação
* Auto Scaling Group

Fluxo principal:

```text
Internet → ALB → Target Group → Auto Scaling Group → EC2 → Aplicação
```

---

## 📁 Estrutura do projeto

```text
.
├── modules/
│   ├── alb/
│   ├── autoscaling/
│   ├── iam/
│   ├── s3/
│   ├── security-group/
│   └── vpc/
│
├── docs/
│   ├── architecture/
│   ├── alb/
│   ├── autoscaling/
│   ├── ec2/
│   ├── iam/
│   ├── s3/
│   ├── security-group/
│   └── vpc/
│
├── examples/
│   └── ec2-standalone/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
├── .gitignore
└── .terraform.lock.hcl
```

---

## 📅 Progresso do projeto

* [x] Fase 1 — VPC
* [x] Fase 2 — S3
* [x] Fase 2 — IAM
* [x] Fase 3 — EC2
* [x] Fase 4 — Application Load Balancer (ALB)
* [x] Fase 5 — Auto Scaling Group
* [x] Fase 5 — Security Group separado da aplicação
* [ ] Fase 6 — NAT Gateway e instâncias privadas
* [ ] Fase 7 — Aplicação web de apresentação
* [ ] Fase 8 — RDS
* [ ] Fase 9 — Lambda
* [ ] Fase 10 — Arquitetura completa

---

## ⚙️ Pré-requisitos

Antes de executar o projeto, é necessário ter:

* Terraform instalado
* AWS CLI configurado
* Conta AWS ativa
* Permissões adequadas para criação dos recursos

---

## 🚀 Comandos principais do Terraform

### Inicializar o projeto

```bash
terraform init
```

### Validar a configuração

```bash
terraform validate
```

### Formatar os arquivos

```bash
terraform fmt
```

### Visualizar o plano

```bash
terraform plan
```

### Aplicar a infraestrutura

```bash
terraform apply
```

### Ver os outputs

```bash
terraform output
```

### Destruir toda a infraestrutura

```bash
terraform destroy
```

---

## 💣 Destruição seletiva de recursos

Para fins de estudo e controle de custo, alguns recursos podem ser destruídos de forma seletiva.

### Destruir apenas o ALB

```bash
terraform destroy -target="module.alb"
```

### Destruir apenas o Auto Scaling Group

```bash
terraform destroy -target="module.autoscaling"
```

### Destruir apenas a EC2 standalone (quando aplicável)

```bash
terraform destroy -target="module.ec2"
```

> ⚠️ O uso de `-target` deve ser feito com cautela, pois pode gerar inconsistência temporária na infraestrutura. Após esse uso, é recomendado executar `terraform plan` para verificar se há mudanças pendentes.

---

## 📚 Documentação

A evolução do projeto está documentada por fase dentro da pasta `docs/`.

### Arquitetura

* `docs/architecture/current-architecture.md`
* `docs/architecture/evolution.md`

### Fases

* `docs/vpc/fase-1-vpc.md`
* `docs/s3/fase-2-s3.md`
* `docs/iam/fase-2-iam.md`
* `docs/ec2/fase-3-ec2.md`
* `docs/alb/fase-4-alb.md`
* `docs/autoscaling/fase-5-autoscaling.md`
* `docs/security-group/fase-5-security-group.md`

---

## 🧪 Como testar

### Verificar outputs

```bash
terraform output
```

### Obter DNS do ALB

```bash
terraform output alb_dns_name
```

### Obter nome do bucket S3

```bash
terraform output bucket_name
```

---

## 📖 Documentação oficial do Terraform

* https://developer.hashicorp.com/terraform/docs
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs

---

## 🧠 Conceitos aplicados

* Infraestrutura como código (IaC)
* Modularização com Terraform
* Naming convention
* VPC e separação de rede
* IAM Roles e Policies
* Integração entre serviços AWS
* Application Load Balancer
* Auto Scaling Group
* Separação de responsabilidades por módulo

---

## 🗂️ Exemplos e legado

A pasta `examples/` guarda implementações anteriores ou exemplos mantidos apenas para fins de estudo e documentação da evolução do projeto.

---

## 💼 Sobre o projeto

Este projeto foi desenvolvido como parte de um plano de estudos prático para domínio de Terraform e AWS, com foco em cenários reais de mercado e construção de portfólio técnico no GitHub.

---

## 🚀 Próximos passos

* NAT Gateway
* Instâncias em subnets privadas
* Aplicação web de apresentação
* Banco de dados RDS
* Integração com Lambda
* Evolução da arquitetura para maior segurança e desacoplamento

---

👨‍💻 Em constante evolução.

