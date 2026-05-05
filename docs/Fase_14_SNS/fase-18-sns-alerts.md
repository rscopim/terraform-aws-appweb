# Fase 14 — SNS para alertas por e-mail

## 🎯 Objetivo

Integrar os alarmes do CloudWatch com Amazon SNS, permitindo envio de notificações por e-mail quando métricas importantes da aplicação entrarem em estado de alarme.

## 🏗️ O que foi criado

* Módulo `sns`
* SNS Topic para alertas
* SNS Subscription por e-mail
* Integração entre CloudWatch Alarms e SNS
* Envio de notificações em estado `ALARM` e retorno `OK`

## 🧠 Conceitos importantes

* **Amazon SNS**: serviço de publicação e assinatura para envio de notificações
* **SNS Topic**: canal onde mensagens são publicadas
* **Subscription**: destino que recebe mensagens do tópico
* **CloudWatch Alarm Actions**: ações executadas quando um alarme muda de estado
* **Confirmação de assinatura**: etapa obrigatória para recebimento de e-mails

## ⚙️ Como funciona

O módulo SNS cria um tópico de alertas e uma assinatura por e-mail.

Os alarmes do CloudWatch recebem o ARN do tópico SNS em `alarm_actions` e `ok_actions`.

Quando um alarme entra em estado `ALARM`, o CloudWatch publica uma mensagem no SNS. O SNS envia o alerta para o e-mail cadastrado.

Fluxo:

```text
CloudWatch Alarm → SNS Topic → E-mail
```

## 🔐 Segurança aplicada

* Alertas centralizados em um tópico SNS
* E-mail precisa confirmar assinatura antes de receber notificações
* Integração feita por ARN, sem credenciais na aplicação
* Alarmes continuam gerenciados por Terraform

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm

## 🧪 Como testar

* Rodar `terraform plan -var-file="dev.tfvars"`
* Rodar `terraform apply -var-file="dev.tfvars"`
* Confirmar a assinatura recebida por e-mail
* Acessar CloudWatch → Alarms
* Validar se os alarmes possuem ação apontando para o SNS Topic
* Simular uma condição de alarme para validar envio de e-mail

## 📌 Observações importantes

* A assinatura por e-mail precisa ser confirmada manualmente
* SNS pode gerar custo conforme volume de mensagens
* Sem confirmação, os alarmes publicam no tópico, mas o e-mail não recebe
* Esta fase adiciona notificação, não altera a aplicação
