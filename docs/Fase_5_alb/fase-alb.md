# Fase 5 — Application Load Balancer (ALB)

## 🎯 Objetivo

Adicionar um Load Balancer na frente da aplicação para receber tráfego HTTP e encaminhar para a EC2.

Fase mais complicada.

## 🏗️ O que foi criado

* Security Group do ALB
* Application Load Balancer
* Target Group
* Listener HTTP
* Associação da EC2 ao Target Group

## 🧠 Conceitos importantes

* ALB: balanceador de carga da AWS
* Target Group: grupo de destinos (EC2)
* Listener: porta que recebe requisições
* Health Check: verificação de saúde da aplicação

## ⚙️ Como funciona

O ALB é criado em subnets públicas e recebe requisições HTTP da internet na porta 80.

Essas requisições são encaminhadas para o Target Group, que contém a instância EC2. O health check garante que apenas instâncias saudáveis recebam tráfego.

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment

## 🧪 Como testar

* Rodar `terraform output alb_dns_name`
* Acessar o DNS do ALB no navegador
