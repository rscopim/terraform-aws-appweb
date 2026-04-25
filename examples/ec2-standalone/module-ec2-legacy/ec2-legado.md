# Exemplo — EC2 Standalone (legado)

## 🎯 Objetivo

Demonstrar a criação de uma instância EC2 standalone como ponto inicial da arquitetura, validando conceitos fundamentais de infraestrutura na AWS com Terraform.

## 🏗️ O que foi criado

* Instância EC2
* Security Group dedicado
* Script de inicialização (`user_data`)
* Integração com S3 via IAM Role

## 🧠 Conceitos importantes

* **EC2 standalone**: execução da aplicação em uma única instância
* **User Data**: automação da configuração inicial da instância
* **Security Group**: controle de acesso à instância
* **IAM Role**: acesso seguro a serviços AWS sem uso de credenciais estáticas

## ⚙️ Como funciona

A instância EC2 é criada em uma subnet pública, recebendo um IP público para acesso direto.

Durante a inicialização, o script de User Data instala o servidor web e publica uma página simples.

A instância utiliza uma IAM Role para acessar o S3 sem necessidade de Access Keys.

Fluxo:

```text
Usuário → Internet → EC2 (IP público) → Aplicação Web
```

## 🔐 Segurança aplicada

* Controle de acesso via Security Group
* Uso de IAM Role para evitar exposição de credenciais
* Acesso direto à instância pela internet (apenas para fins de teste)

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role

## 🧪 Como testar

* Executar:

```bash
terraform apply
```

* Obter o IP público da instância
* Acessar a aplicação via navegador
* Validar funcionamento do servidor web

## 📌 Observações importantes

* Esta abordagem foi utilizada apenas como etapa inicial de aprendizado
* A aplicação depende de uma única instância (single point of failure)
* Não possui balanceamento de carga nem escalabilidade
* Não representa uma arquitetura adequada para produção

## 🚀 Evolução da arquitetura

A arquitetura evoluiu para um modelo mais robusto e próximo de produção, utilizando:

* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* Instâncias em subnets privadas
* NAT Gateway para saída de internet
* Separação entre camadas de rede, aplicação e dados

## 📌 Finalidade deste exemplo

Este exemplo foi mantido no repositório como referência histórica e material de estudo, demonstrando a evolução da arquitetura ao longo do projeto.

---

