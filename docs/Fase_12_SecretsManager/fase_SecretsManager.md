# Fase 12 — Aplicação lendo credenciais do Secrets Manager

## 🎯 Objetivo

Permitir que a aplicação leia metadados seguros do secret do RDS no AWS Secrets Manager, sem expor a senha no código ou na página web.

## 🏗️ O que foi ajustado

* Permissão IAM para `secretsmanager:GetSecretValue`
* Passagem do ARN do secret para o Launch Template
* Leitura do secret no `user_data`
* Exibição segura do usuário do RDS e status de leitura na página

## 🧠 Conceitos importantes

* Secrets Manager: serviço para armazenar segredos
* GetSecretValue: operação para recuperar o valor do secret
* IAM Least Privilege: permissão restrita ao ARN do secret
* User Data: automação executada no boot da instância

## ⚙️ Como funciona

A instância EC2 recebe uma IAM Role com permissão para ler apenas o secret do RDS. Durante o boot, o `user_data` executa AWS CLI para recuperar o SecretString, extrai o usuário e exibe apenas informações não sensíveis na página.

## 🔐 Segurança aplicada

* Senha não fica no Terraform
* Senha não fica no `tfvars`
* Senha não é exibida na aplicação
* EC2 acessa apenas o secret específico do RDS

## 📚 Documentação oficial

* https://docs.aws.amazon.com/cli/latest/reference/secretsmanager/get-secret-value.html
* https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieving-secrets_cli.html
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance

## 🧪 Como testar

* Rodar `terraform apply -var-file="dev.tfvars"`
* Renovar instâncias do ASG
* Acessar o DNS do ALB
* Confirmar que o card Secrets Manager mostra o usuário do RDS
* Confirmar que a senha não é exibida

## 📌 Observações importantes

* A leitura ocorre no boot da instância
* Para aplicações reais, a leitura deve ocorrer em runtime com cache
* O Secrets Manager pode gerar custo adicional
