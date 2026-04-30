# Fase 13 — Secrets Manager para credenciais do RDS

## 🎯 Objetivo

Remover a senha do RDS dos arquivos Terraform e passar a utilizar AWS Secrets Manager para gerenciamento da credencial master do banco de dados.

## 🏗️ O que foi ajustado

* Remoção da variável `db_password`
* Remoção da senha dos arquivos `dev.tfvars` e `prod.tfvars`
* Ativação do gerenciamento da senha master pelo RDS
* Criação automática do secret no AWS Secrets Manager

## 🧠 Conceitos importantes

* **AWS Secrets Manager**: serviço para armazenar e gerenciar segredos com segurança
* **RDS Managed Master Password**: integração nativa onde o RDS gerencia a senha master
* **Secret ARN**: identificador do segredo criado no Secrets Manager
* **Credenciais sensíveis**: informações que não devem ficar em código ou arquivos versionados

## ⚙️ Como funciona

O RDS passa a gerenciar automaticamente a senha do usuário master usando o AWS Secrets Manager.

O Terraform define apenas o usuário administrador do banco. A senha deixa de ser informada no código e passa a ser criada e armazenada automaticamente no Secrets Manager.

Fluxo:

```text
Terraform → RDS → Secrets Manager
```

## 🔐 Segurança aplicada

* Senha removida do `terraform.tfvars`
* Senha não aparece no código Terraform
* Credencial armazenada em serviço gerenciado pela AWS
* Redução do risco de exposição acidental em GitHub ou logs

## 📚 Documentação oficial

* https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-secrets-manager.html
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance

## 🧪 Como testar

* Rodar `terraform plan -var-file="dev.tfvars"`
* Rodar `terraform apply -var-file="dev.tfvars"`
* Acessar o console do AWS Secrets Manager
* Localizar o secret criado automaticamente pelo RDS
* Confirmar que o RDS permanece sem acesso público

## 📌 Observações importantes

* O Secrets Manager pode gerar custo adicional
* O secret passa a ser gerenciado pelo RDS
* A senha não deve mais ser definida manualmente no `tfvars`
* Alterações em banco de dados devem ser revisadas com atenção antes do `apply`

