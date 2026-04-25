# Fase 3 — IAM (Permissões)

## 🎯 Objetivo

Permitir que as instâncias EC2 acessem o Amazon S3 de forma segura, utilizando IAM Role, sem a necessidade de credenciais estáticas (Access Keys).

---

## 🏗️ O que foi criado

* IAM Role para EC2
* IAM Policy com permissões de acesso ao S3
* Role Policy Attachment (associação entre Role e Policy)
* Instance Profile (vinculação da Role à EC2)

---

## 🧠 Conceitos importantes

* **IAM Role**: identidade atribuída a um serviço AWS (como EC2), permitindo acesso a outros recursos
* **IAM Policy**: define quais ações são permitidas ou negadas
* **Instance Profile**: mecanismo que permite associar uma IAM Role a uma instância EC2
* **Princípio do menor privilégio**: conceder apenas as permissões necessárias

---

## ⚙️ Como funciona

A instância EC2 é configurada para assumir uma IAM Role por meio de um Instance Profile.

Essa Role possui uma Policy associada que define as permissões de acesso ao S3.

Dessa forma, a aplicação pode interagir com o S3 sem utilizar credenciais fixas no código.

Fluxo de acesso:

```text
EC2
 ↓
IAM Role
 ↓
IAM Policy
 ↓
Amazon S3
```

---

## 🔐 Segurança aplicada

* Eliminação do uso de Access Keys na aplicação
* Uso de credenciais temporárias gerenciadas pela AWS
* Permissões controladas via IAM Policy
* Base para aplicação do princípio do menor privilégio

---

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile

---

## 🧪 Como testar

* Verificar a IAM Role criada no console AWS
* Confirmar que a Policy está associada à Role
* Validar o Instance Profile vinculado à instância EC2
* (Opcional) Testar acesso ao S3 a partir da EC2 utilizando AWS CLI

---

## 📌 Observações importantes

* IAM Role é a forma recomendada de acesso entre serviços na AWS
* Evita exposição de credenciais sensíveis
* Facilita o gerenciamento de permissões em ambientes escaláveis

---

## 🚀 Evolução futura

* Refinar permissões para acesso apenas ao bucket específico (evitar `s3:*`)
* Uso de políticas mais restritivas (least privilege)
* Integração com outros serviços (RDS, DynamoDB, Lambda)
* Auditoria de acesso com AWS CloudTrail

---
