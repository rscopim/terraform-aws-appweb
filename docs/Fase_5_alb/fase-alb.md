# Fase 5 — Application Load Balancer (ALB)

## 🎯 Objetivo

Adicionar um Application Load Balancer (ALB) para receber tráfego HTTP da internet e distribuir as requisições para a aplicação, aumentando disponibilidade e preparando a arquitetura para escalabilidade.

---

## 🏗️ O que foi criado

* Security Group do ALB
* Application Load Balancer
* Target Group
* Listener HTTP (porta 80)
* Associação da instância EC2 ao Target Group

---

## 🧠 Conceitos importantes

* **Application Load Balancer (ALB)**: balanceador de carga que opera na camada 7 (HTTP/HTTPS)
* **Target Group**: grupo de recursos que recebem o tráfego (ex: instâncias EC2)
* **Listener**: componente que escuta requisições em uma porta específica
* **Health Check**: mecanismo que verifica se os destinos estão saudáveis

---

## ⚙️ Como funciona

O Application Load Balancer é provisionado em subnets públicas, permitindo receber tráfego diretamente da internet.

O Listener escuta requisições HTTP na porta 80 e as encaminha para o Target Group.

O Target Group contém a instância EC2 criada na fase anterior. O ALB distribui as requisições apenas para instâncias consideradas saudáveis, com base no Health Check.

Fluxo de acesso:

```text
Usuário
  ↓
Internet
  ↓
Application Load Balancer (ALB)
  ↓
Target Group
  ↓
EC2 (Aplicação)
```

---

## 🔐 Segurança aplicada

* ALB exposto à internet apenas via porta HTTP (80)
* EC2 pode ser protegida para aceitar tráfego apenas do Security Group do ALB
* Separação entre camada pública (ALB) e camada de aplicação

---

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment

---

## 🧪 Como testar

* Obter o DNS do Load Balancer:

```bash
terraform output alb_dns_name
```

* Acessar no navegador:

```text
http://<ALB_DNS_NAME>
```

* Validar se a aplicação está sendo exibida corretamente
* Verificar no console AWS se o Target Group está com status **healthy**

---

## 📌 Observações importantes

* O ALB substitui o acesso direto à EC2, sendo a forma recomendada em arquiteturas reais
* O Health Check é essencial para garantir alta disponibilidade
* Essa fase prepara a arquitetura para uso de Auto Scaling

---

## 🚀 Evolução futura

* Integração com Auto Scaling Group (múltiplas instâncias)
* Migração completa das instâncias para subnets privadas
* Configuração de HTTPS (TLS/SSL) com AWS Certificate Manager
* Implementação de regras avançadas de roteamento (path-based routing)

---

