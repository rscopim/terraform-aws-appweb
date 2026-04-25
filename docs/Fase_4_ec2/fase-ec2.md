# Fase 4 — EC2 (Aplicação Web)

## 🎯 Objetivo

Provisionar uma instância EC2 com servidor web configurado automaticamente, permitindo acesso à aplicação via navegador e integração com o Amazon S3 através de IAM Role.

---

## 🏗️ O que foi criado

* Instância EC2
* Security Group (acesso HTTP)
* Script de inicialização (User Data)
* Integração com IAM Role (acesso ao S3)

---

## 🧠 Conceitos importantes

* **Amazon EC2 (Elastic Compute Cloud)**: serviço de computação que permite criar servidores virtuais na AWS
* **Security Group**: firewall que controla tráfego de entrada e saída da instância
* **User Data**: script executado automaticamente na inicialização da instância
* **AMI (Amazon Machine Image)**: imagem base utilizada para criar a instância

---

## ⚙️ Como funciona

A instância EC2 é provisionada em uma subnet pública, recebendo um IP público para acesso via internet.

Durante a inicialização, o script de User Data executa automaticamente:

* atualização do sistema operacional
* instalação do servidor web (Apache)
* criação de uma página HTML de teste

O acesso HTTP (porta 80) é permitido pelo Security Group.

Fluxo de acesso:

```text id="4gpr9c"
Usuário
  ↓
Internet
  ↓
EC2 (IP público)
  ↓
Servidor Web (Apache)
```

---

## 🔐 Segurança aplicada

* Controle de acesso via Security Group (porta 80 liberada apenas para HTTP)
* Uso de IAM Role para acesso ao S3 (sem credenciais no código)
* Base para futura migração da aplicação para subnets privadas (via ALB)

---

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

---

## 🧪 Como testar

* Obter o IP público da instância:

```bash id="z3z08q"
terraform output
```

* Acessar no navegador:

```text id="v1w8b4"
http://<IP_PUBLICO>
```

* Validar se a página web está sendo exibida corretamente
* Confirmar que o Security Group permite acesso HTTP

---

## 📌 Observações importantes

* Nesta fase, a instância está em subnet pública para facilitar testes
* Em arquiteturas reais, a aplicação normalmente roda em subnets privadas atrás de um Load Balancer
* O uso de User Data permite automatizar completamente a configuração da instância

---

## 🚀 Evolução futura

* Substituir acesso direto por Application Load Balancer (ALB)
* Migrar instâncias para subnets privadas
* Implementar Auto Scaling para alta disponibilidade
* Evoluir a aplicação para integração com S3 e RDS

---

