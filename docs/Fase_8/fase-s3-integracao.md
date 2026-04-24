# Fase 8 — Integração com S3 pela aplicação

## 🎯 Objetivo

Permitir que a aplicação interaja com o S3, gravando e lendo dados.

## 🏗️ O que foi criado

* Escrita de arquivo no S3 via AWS CLI
* Leitura de arquivo do S3
* Exibição do conteúdo na aplicação web

## 🧠 Conceitos importantes

* IAM Role: acesso seguro ao S3
* S3: armazenamento persistente
* AWS CLI: interação com serviços AWS
* user_data: execução automática na inicialização

## ⚙️ Como funciona

A instância cria um arquivo local, envia para o S3 e depois lê esse mesmo arquivo para exibir na página web.

## 🧪 Como testar

* Rodar `terraform apply`
* Acessar o ALB
* Atualizar a página e verificar o conteúdo vindo do S3
