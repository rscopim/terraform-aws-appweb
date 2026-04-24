# Fase 9 — RDS (Banco de Dados em subnets privadas)

## 🎯 Objetivo

Criar um banco de dados relacional utilizando Amazon RDS, implantado em subnets privadas e acessível apenas pela aplicação.

---

## 🏗️ O que foi criado

* DB Subnet Group
* Security Group do RDS
* Instância RDS (MySQL)
* Integração com a aplicação via Security Group

---

## 🧠 Conceitos importantes

* **RDS (Relational Database Service)**: serviço gerenciado de banco de dados da AWS
* **DB Subnet Group**: define em quais subnets o RDS pode ser criado
* **Subnet privada**: sem acesso direto à internet
* **Security Group**: controla quem pode acessar o banco
* **Porta 3306**: padrão do MySQL

---

## ⚙️ Como funciona

O banco de dados é criado dentro de subnets privadas da VPC, sem acesso público.

O acesso ao RDS é permitido apenas para instâncias da aplicação (Auto Scaling Group), através do Security Group da aplicação.

Fluxo de acesso:

```text
EC2 (ASG) → Security Group → RDS (MySQL)
```

---

## 🔐 Segurança aplicada

* `publicly_accessible = false` → RDS não é exposto à internet
* Security Group permite acesso apenas da aplicação
* Banco isolado em subnets privadas
* Sem uso de credenciais públicas expostas na aplicação

---

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

---

## 🧪 Como testar

1. Rodar o Terraform:

```bash
terraform apply
```

2. Validar no console AWS:

* RDS criado com sucesso
* Status disponível (`Available`)
* Sem acesso público
* Subnets privadas configuradas

3. (Opcional) Testar conexão via EC2:

```bash
mysql -h <endpoint-rds> -u admin -p
```

---

## 📌 Observações importantes

* O banco pode levar alguns minutos para ficar disponível após criação
* A senha está definida diretamente no código (será melhorado em fases futuras)
* O acesso ao banco é restrito à aplicação, aumentando a segurança da arquitetura

---

## 🚀 Evolução futura

* Uso de AWS Secrets Manager para armazenar credenciais
* Conexão da aplicação diretamente com o banco
* Criação de tabelas e persistência de dados reais
* Backup automatizado do RDS
* Alta disponibilidade (Multi-AZ)

---
