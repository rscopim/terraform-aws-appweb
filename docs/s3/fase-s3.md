# Fase 2 — S3 (Armazenamento)

## 🎯 Objetivo

Criar um bucket S3 com nome único para armazenamento de dados.

## 🏗️ O que foi criado

* Bucket S3
* Nome dinâmico com random_id

## 🧠 Conceitos importantes

* S3 é um serviço de armazenamento de objetos
* Nomes de bucket são globais
* Uso de random_id evita conflito

## ⚙️ Como funciona

O nome do bucket é gerado dinamicamente usando o nome do projeto e um sufixo aleatório.

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

## 🧪 Como testar

* Rodar `aws s3 ls`
* Verificar bucket no console AWS
