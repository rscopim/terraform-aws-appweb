# Fase 6 — Auto Scaling em subnets privadas

## 🎯 Objetivo

Mover o Auto Scaling Group para as subnets privadas, utilizando o NAT Gateway para saída à internet.

## 🏗️ O que foi ajustado

* Auto Scaling Group passou a usar subnets privadas
* Instâncias EC2 deixaram de ser criadas em subnets públicas
* Integração com NAT Gateway para acesso de saída à internet

## 🧠 Conceitos importantes

* Subnet privada: sem acesso direto da internet
* NAT Gateway: permite saída à internet para instâncias privadas
* ALB: continua sendo a porta de entrada pública
* Auto Scaling Group: cria instâncias privadas e registra no Target Group

## ⚙️ Como funciona

O Auto Scaling Group agora cria instâncias nas subnets privadas da VPC. Essas instâncias não recebem IP público e usam o NAT Gateway para baixar pacotes e acessar serviços externos. O tráfego de entrada continua passando pelo ALB.

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

## 🧪 Como testar

* Rodar `terraform plan`
* Rodar `terraform apply`
* Verificar no console AWS se as instâncias do ASG estão em subnets privadas
* Acessar o DNS do ALB no navegador
