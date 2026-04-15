# Exemplo — EC2 (legado)

Este exemplo representa uma etapa anterior da arquitetura do projeto, quando a aplicação era executada em uma única instância EC2.

## 🎯 Objetivo

Demonstrar a criação de uma EC2 com:

* Security Group próprio
* servidor web instalado com `user_data`
* integração com S3 via IAM

## 🏗️ O que esta abordagem representava

Na fase inicial do projeto, a EC2 standalone foi utilizada para validar conceitos como:

* criação de instância com Terraform
* uso de `user_data`
* configuração de Security Group
* integração entre EC2, IAM e S3
* publicação inicial de uma aplicação web simples

## 🧠 Limitações dessa abordagem

Embora útil para aprendizado inicial, a abordagem de instância única possui limitações arquiteturais:

* ausência de alta disponibilidade
* dependência de uma única instância
* escalabilidade limitada
* maior acoplamento entre compute e segurança

## ⚙️ Evolução da arquitetura

A arquitetura atual do projeto evoluiu para utilizar:

* Application Load Balancer
* Auto Scaling Group
* Security Group separado da aplicação

Essa mudança tornou o projeto mais modular, mais limpo e mais próximo de um cenário real de produção.

## 📚 Observação

Este conteúdo foi mantido apenas para fins de estudo, documentação da evolução do projeto e referência histórica.
