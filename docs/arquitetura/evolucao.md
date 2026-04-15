# Evolução da arquitetura

## Etapa inicial

A arquitetura começou com uma abordagem simples, baseada em uma única instância EC2.

Nessa etapa, a aplicação era executada em:

* uma EC2 standalone
* com Security Group próprio
* com servidor web instalado via `user_data`
* com integração ao S3 por meio de IAM Role

Essa fase foi importante para validar os conceitos iniciais de:

* provisionamento com Terraform
* uso de módulos
* integração entre EC2, IAM e S3
* criação de uma aplicação acessível pela web

---

## Limitações identificadas

Conforme a arquitetura evoluiu, algumas limitações da EC2 standalone ficaram evidentes:

* dependência de uma única instância
* ausência de alta disponibilidade
* acoplamento entre EC2 e Security Group
* dificuldade de escalar horizontalmente
* arquitetura distante de um cenário real de produção

---

## Evolução adotada

Para resolver essas limitações, a arquitetura foi refatorada para utilizar:

* Application Load Balancer (ALB)
* Auto Scaling Group
* Security Group da aplicação em módulo separado
* múltiplas subnets em diferentes Availability Zones
* maior separação de responsabilidades entre os módulos

---

## Estado atual

A arquitetura atual do projeto utiliza:

* VPC
* subnets públicas e privadas
* Internet Gateway
* S3
* IAM
* ALB
* Security Group dedicado para a aplicação
* Auto Scaling Group

Fluxo principal:

```text
Internet → ALB → Target Group → Auto Scaling Group → EC2 → Aplicação
```

---

## Benefícios da evolução

A nova arquitetura trouxe vantagens importantes:

* maior organização do projeto
* redução de acoplamento entre módulos
* melhor alinhamento com arquitetura de produção
* escalabilidade horizontal
* base mais sólida para próximas evoluções

---

## Estratégia adotada no repositório

Para manter o projeto limpo e profissional:

* a arquitetura atual permanece na raiz e em `modules/`
* a evolução fica registrada em `docs/`
* implementações anteriores podem ser preservadas em `examples/`

Essa decisão ajuda a manter:

* clareza para quem lê o repositório
* histórico técnico da construção
* portfólio mais organizado

