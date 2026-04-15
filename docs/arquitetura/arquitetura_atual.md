# Arquitetura atual

## Visão geral

A arquitetura atual do projeto foi estruturada para representar uma base sólida de aplicação web na AWS utilizando Terraform.

Os principais componentes são:

* VPC
* Subnets públicas
* Subnets privadas
* Internet Gateway
* S3
* IAM
* Application Load Balancer
* Security Group da aplicação
* Auto Scaling Group

---

## Fluxo principal

```text
Internet → ALB → Target Group → Auto Scaling Group → EC2 → Aplicação
```

---

## Componentes

### VPC

Responsável por isolar a rede da aplicação.

### Subnets públicas

Utilizadas para recursos que precisam de acesso direto à internet, como o ALB.

### Subnets privadas

Preparadas para receber recursos internos da aplicação, como instâncias e banco de dados em fases futuras.

### Internet Gateway

Permite comunicação com a internet para os recursos adequadamente roteados.

### S3

Utilizado como armazenamento de objetos e apoio à aplicação.

### IAM

Responsável pelo controle de permissões entre os serviços, evitando uso de credenciais estáticas.

### ALB

Recebe requisições HTTP da internet e distribui o tráfego para as instâncias da aplicação.

### Security Group da aplicação

Controla o acesso às instâncias, permitindo comunicação HTTP apenas a partir do ALB.

### Auto Scaling Group

Mantém a quantidade desejada de instâncias da aplicação e permite evolução para cenários mais escaláveis.

---

## Características da arquitetura

* modularização com Terraform
* separação de responsabilidades
* base para alta disponibilidade
* integração entre múltiplos serviços AWS
* pronta para evoluções futuras

---

## Evoluções previstas

As próximas melhorias da arquitetura incluem:

* NAT Gateway
* instâncias privadas com saída controlada
* aplicação web de apresentação
* RDS
* Lambda
* integração mais completa entre serviços

