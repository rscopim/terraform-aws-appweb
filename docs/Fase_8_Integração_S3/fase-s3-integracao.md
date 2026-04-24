# Fase 8 — Integração da aplicação com S3

## 🎯 Objetivo

Permitir que a aplicação interaja com o S3, gravando e lendo dados durante a inicialização da instância.

## 🏗️ O que foi criado

* Escrita de arquivo no S3
* Leitura de arquivo do S3
* Exibição da mensagem na página web
* Validação da integração EC2 → IAM Role → S3

## 🧠 Conceitos importantes

* IAM Role: concede permissão à EC2 sem uso de access keys
* S3: armazenamento de objetos
* AWS CLI: usado pela instância para interagir com o S3
* User Data: executa automações no boot da instância

## ⚙️ Como funciona

Durante a inicialização, a instância cria uma mensagem local, envia para o bucket S3, baixa o arquivo novamente e exibe o conteúdo na página web.

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template

## 🧪 Como testar

* Rodar `terraform apply`
* Renovar as instâncias do Auto Scaling Group
* Acessar o DNS do ALB
* Validar a mensagem exibida na página
* Conferir o arquivo no bucket S3
