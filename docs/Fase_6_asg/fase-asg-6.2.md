# Fase 6.2 — Auto Scaling em subnets privadas com NAT Gateway

## 🎯 Objetivo

Mover o Auto Scaling Group para subnets privadas, mantendo o Application Load Balancer como única entrada pública da aplicação.

## 🏗️ O que foi criado

* Auto Scaling Group utilizando subnets privadas
* Integração com NAT Gateway para saída de internet
* Ajuste na arquitetura de rede da aplicação

## 🧠 Conceitos importantes

* **Subnet privada**: não possui acesso direto à internet
* **NAT Gateway**: permite saída de internet para recursos privados
* **Application Load Balancer (ALB)**: ponto de entrada público da aplicação
* **Auto Scaling Group**: cria e gerencia instâncias automaticamente

## ⚙️ Como funciona

O Application Load Balancer permanece nas subnets públicas, recebendo requisições da internet.

As instâncias EC2 passam a ser criadas em subnets privadas, sem IP público.

Quando precisam acessar a internet (instalação de pacotes, atualizações, etc.), utilizam o NAT Gateway.

Fluxo de entrada:

```text
Internet → ALB → Target Group → EC2 (subnet privada)
```

Fluxo de saída:

```text
EC2 (subnet privada) → NAT Gateway → Internet
```

## 🔐 Segurança aplicada

* Instâncias EC2 não possuem IP público
* A entrada pública ocorre apenas via ALB
* Security Group da aplicação permite tráfego apenas do ALB
* NAT Gateway permite saída sem expor as instâncias

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template

## 🧪 Como testar

* Executar:

```bash
terraform apply
```

* Verificar no console AWS se as instâncias estão nas subnets privadas
* Confirmar que as instâncias não possuem IP público
* Verificar se o Target Group está **healthy**
* Acessar o DNS do ALB no navegador

## 📌 Observações importantes

* Esta fase melhora significativamente a segurança da arquitetura
* O ALB passa a ser o único ponto de entrada público
* O NAT Gateway gera custo e pode ser removido quando não necessário

## 🚀 Evolução futura

* Implementar políticas de Auto Scaling baseadas em CPU ou requisições
* Melhorar monitoramento com CloudWatch
* Integrar aplicação com RDS e S3 de forma mais completa
