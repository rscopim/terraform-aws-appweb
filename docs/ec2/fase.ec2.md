# Fase 3 — EC2 (Aplicação Web)

## 🎯 Objetivo

Criar uma EC2 com servidor web e integração com S3 via IAM.

## 🏗️ O que foi criado

* EC2
* Security Group
* User Data script
* Integração com IAM Role

## 🧠 Conceitos importantes

* EC2: servidor virtual
* Security Group: firewall
* User Data: script de inicialização

## ⚙️ Como funciona

A instância é criada em subnet pública, recebe um IP público e executa um script que instala o Apache e cria uma página web.

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

## 🧪 Como testar

* Rodar `terraform output`
* Acessar IP público no navegador
