# Fase 9 — RDS (Banco de Dados em subnets privadas)

## 🎯 Objetivo

Criar um banco de dados relacional utilizando Amazon RDS, implantado em subnets privadas e acessível apenas pela aplicação.

## 🏗️ O que foi criado

* DB Subnet Group
* Security Group do RDS
* Instância RDS (MySQL)
* Integração com a aplicação via Security Group

## 🧠 Conceitos importantes

* **Amazon RDS (Relational Database Service)**: serviço gerenciado de banco de dados
* **DB Subnet Group**: define em quais subnets o banco será provisionado
* **Subnet privada**: não possui acesso direto à internet
* **Security Group**: controla quais recursos podem acessar o banco
* **Porta 3306**: porta padrão utilizada pelo MySQL

## ⚙️ Como funciona

O banco de dados é provisionado dentro de subnets privadas da VPC, sem acesso público.

Um DB Subnet Group define as subnets onde o RDS pode ser criado.

O acesso ao banco é permitido apenas para instâncias da aplicação (Auto Scaling Group), por meio do Security Group da aplicação.

Fluxo de acesso:

```text id="9o6c6g"
EC2 (Auto Scaling Group)
   ↓
Security Group
   ↓
Amazon RDS (MySQL)
```

## 🔐 Segurança aplicada

* `publicly_accessible = false` → RDS não exposto à internet
* Security Group permite acesso apenas da aplicação
* Banco isolado em subnets privadas
* Nenhuma credencial sensível exposta na aplicação
* Separação entre camada de aplicação e banco de dados

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

## 🧪 Como testar

* Executar:

```bash id="u7k3kn"
terraform apply
```

* Validar no console AWS:

  * Instância RDS criada com sucesso
  * Status `Available`
  * Sem acesso público
  * Subnets privadas corretamente associadas

* (Opcional) Testar conexão via EC2:

```bash id="m0np2s"
mysql -h <endpoint-rds> -u admin -p
```

## 📌 Observações importantes

* A criação do RDS pode levar alguns minutos
* O acesso ao banco é restrito à aplicação, aumentando a segurança
* Nesta fase, as credenciais ainda estão definidas diretamente no código (melhoria futura)
* O banco não é acessível diretamente da internet

## 🚀 Evolução futura

* Utilizar AWS Secrets Manager para armazenamento seguro de credenciais
* Conectar a aplicação diretamente ao banco de dados
* Criar estrutura de tabelas e persistência de dados
* Implementar backups automáticos
* Configurar alta disponibilidade (Multi-AZ)

---
