# Fase 13 — CloudWatch Logs

## 🎯 Objetivo

Criar um módulo dedicado de observabilidade utilizando Amazon CloudWatch Logs, permitindo centralizar logs da aplicação e da instância EC2.

## 🏗️ O que foi criado

* Módulo `cloudwatch`
* CloudWatch Log Group
* Permissão IAM para envio de logs
* Configuração do CloudWatch Agent no `user_data`
* Envio de logs do sistema e Apache para o CloudWatch

## 🧠 Conceitos importantes

* **CloudWatch Logs**: serviço para centralização de logs
* **Log Group**: agrupamento lógico dos logs
* **Log Stream**: fluxo individual de logs por instância ou arquivo
* **CloudWatch Agent**: agente instalado na EC2 para enviar logs
* **Observabilidade**: capacidade de entender o comportamento do sistema

## ⚙️ Como funciona

O módulo CloudWatch cria um Log Group.

O módulo Auto Scaling recebe o nome desse Log Group e configura o CloudWatch Agent nas instâncias EC2 durante o boot.

Os logs do sistema e do Apache são enviados automaticamente para o CloudWatch Logs.

Fluxo:

```text
EC2 → CloudWatch Agent → CloudWatch Logs
```

## 🔐 Segurança aplicada

* EC2 envia logs usando IAM Role
* Não há necessidade de expor a instância publicamente
* Permissão gerenciada `CloudWatchAgentServerPolicy`
* Logs ficam centralizados na AWS

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group
* https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html
* https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html

## 🧪 Como testar

* Rodar `terraform apply -var-file="dev.tfvars"`
* Renovar as instâncias do Auto Scaling Group
* Acessar a aplicação pelo ALB
* Acessar no console AWS: CloudWatch → Logs → Log Groups
* Verificar o Log Group criado em `/<project_name_safe>/app`
* Confirmar a chegada dos logs da instância

## 📌 Observações importantes

* CloudWatch Logs pode gerar custo conforme volume e retenção
* A retenção dos logs é controlada por variável
* A EC2 precisa ter permissão IAM para enviar logs
* O CloudWatch Agent roda dentro da instância EC2
* Nesta fase foram implementados apenas logs; alarmes serão criados em uma fase futura

## 🚀 Evolução futura

* Criar alarmes de CPU
* Criar alarmes do ALB
* Criar dashboard CloudWatch
* Enviar alertas via SNS
* Monitorar RDS
