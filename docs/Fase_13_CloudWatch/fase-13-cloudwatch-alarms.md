# Fase 17 — CloudWatch Alarms

## 🎯 Objetivo

Criar alarmes no Amazon CloudWatch para monitorar indicadores importantes da aplicação e da infraestrutura, permitindo identificar problemas de desempenho, falhas no Load Balancer e instâncias não saudáveis.

## 🏗️ O que foi criado

* Alarme de CPU alta no Auto Scaling Group
* Alarme de erros HTTP 5XX no Application Load Balancer
* Alarme para targets não saudáveis no Target Group
* Variáveis de threshold por ambiente DEV e PROD

## 🧠 Conceitos importantes

* **CloudWatch Alarm**: monitora uma métrica e muda de estado conforme limites definidos
* **Metric Namespace**: categoria da métrica, como `AWS/EC2` ou `AWS/ApplicationELB`
* **Threshold**: limite que dispara o alarme
* **Evaluation Periods**: quantidade de períodos avaliados antes de mudar o estado
* **Dimensions**: identificadores usados para filtrar métricas por recurso

## ⚙️ Como funciona

O módulo CloudWatch cria alarmes baseados em métricas da AWS.

O alarme de CPU monitora o Auto Scaling Group. O alarme de 5XX monitora erros gerados pelo ALB. O alarme de targets não saudáveis verifica se existem instâncias com falha no Target Group.

Fluxo:

```text
EC2 / ALB / Target Group → CloudWatch Metrics → CloudWatch Alarms
```

## 🔐 Segurança aplicada

* Alarmes não expõem recursos publicamente
* Monitoramento centralizado via CloudWatch
* Sem necessidade de acesso direto às instâncias
* A infraestrutura continua em subnets privadas

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm
* https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Alarms.html
* https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html

## 🧪 Como testar

* Rodar `terraform plan -var-file="dev.tfvars"`
* Rodar `terraform apply -var-file="dev.tfvars"`
* Acessar CloudWatch → Alarms
* Verificar os alarmes criados
* Validar o estado dos alarmes
* Gerar carga na aplicação para testar o alarme de CPU
* Simular falha na aplicação para testar targets não saudáveis

## 📌 Observações importantes

* Nesta fase os alarmes ainda não enviam notificações
* A próxima evolução será integrar alarmes com SNS
* Thresholds podem ser diferentes entre DEV e PROD
* Alarmes podem gerar custo baixo dependendo do uso

## 🚀 Evolução futura

* Integrar alarmes com SNS
* Enviar alertas por e-mail
* Criar dashboards CloudWatch
* Monitorar RDS
* Criar alarmes compostos
