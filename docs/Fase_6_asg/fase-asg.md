# Fase 6 — Auto Scaling Group

## 🎯 Objetivo

Criar múltiplas instâncias EC2 automaticamente e integrar o grupo ao Load Balancer.

## 🏗️ O que foi criado

* Launch Template
* Auto Scaling Group
* Integração com Target Group do ALB
* Instâncias EC2 automáticas

## 🧠 Conceitos importantes

* Launch Template: modelo de configuração das instâncias
* Auto Scaling Group: grupo que cria e mantém EC2 automaticamente
* Desired Capacity: quantidade desejada de instâncias
* Target Group: grupo de destinos do ALB

## ⚙️ Como funciona

O Launch Template define como as instâncias devem ser criadas. O Auto Scaling Group usa esse modelo para manter instâncias disponíveis e registrá-las automaticamente no Target Group do ALB.

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group

## 🧪 Como testar

* Rodar `terraform output alb_dns_name`
* Acessar o DNS do ALB no navegador
* Validar no console AWS se o Auto Scaling Group criou instâncias
