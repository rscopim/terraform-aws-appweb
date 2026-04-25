# Fase 6.1 — Auto Scaling Group

## 🎯 Objetivo

Criar múltiplas instâncias EC2 automaticamente e integrar o grupo ao Application Load Balancer, permitindo escalabilidade horizontal da aplicação.

## 🏗️ O que foi criado

* Launch Template
* Auto Scaling Group
* Integração com Target Group do ALB
* Instâncias EC2 criadas automaticamente

## 🧠 Conceitos importantes

* **Launch Template**: modelo de configuração das instâncias EC2
* **Auto Scaling Group (ASG)**: grupo que cria, monitora e substitui instâncias automaticamente
* **Desired Capacity**: quantidade desejada de instâncias em execução
* **Min Size / Max Size**: limites mínimo e máximo de instâncias
* **Target Group**: grupo de destinos utilizado pelo ALB

## ⚙️ Como funciona

O Launch Template define como as instâncias devem ser criadas, incluindo AMI, tipo de instância, Security Group, IAM Role e script de inicialização.

O Auto Scaling Group utiliza esse modelo para manter a quantidade desejada de instâncias e registra automaticamente essas instâncias no Target Group do ALB.

Fluxo de requisições:

```text
ALB → Target Group → Auto Scaling Group → EC2
```

## 🔐 Segurança aplicada

* As instâncias utilizam Security Group controlado
* O acesso à aplicação ocorre via ALB
* Uso de IAM Role elimina necessidade de credenciais fixas

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group

## 🧪 Como testar

* Executar:

```bash
terraform output alb_dns_name
```

* Acessar o DNS do ALB no navegador
* Validar no console AWS se o Auto Scaling Group criou as instâncias
* Verificar se as instâncias estão registradas no Target Group
* Confirmar que o Target Group está com status **healthy**

## 📌 Observações importantes

* Esta fase introduz escalabilidade horizontal
* O ASG substitui automaticamente instâncias com falha
* O ALB distribui o tráfego entre múltiplas instâncias

## 🚀 Evolução futura

* Mover instâncias para subnets privadas
* Implementar políticas de escala automática baseadas em métricas
* Melhorar observabilidade com CloudWatch
