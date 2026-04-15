# Fase 3 — IAM (Permissões)

## 🎯 Objetivo

Permitir que a EC2 acesse o S3 de forma segura usando IAM Role.

## 🏗️ O que foi criado

* IAM Role
* IAM Policy
* Role Policy Attachment
* Instance Profile

## 🧠 Conceitos importantes

* Role: identidade da EC2
* Policy: permissões
* Instance Profile: ligação entre EC2 e Role

## ⚙️ Como funciona

A EC2 assume uma role que possui permissões para acessar o S3, eliminando a necessidade de access keys.

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy

## 🧪 Como testar

* Verificar Role no IAM
* Conferir Policy anexada
