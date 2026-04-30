# Fase 3 — IAM Least Privilege - melhoria na politica de acesso ao S3.

## 🔄 Evolução da arquitetura

Na fase inicial do projeto, foi utilizada uma política com permissões amplas:

- `s3:*` em `*`

Essa abordagem facilitou o desenvolvimento inicial, porém não segue boas práticas de segurança.

Nesta fase, a política foi refinada seguindo o princípio de menor privilégio (Least Privilege), permitindo apenas:

- Listagem do bucket
- Leitura de objetos
- Escrita de objetos

Restrito exclusivamente ao bucket da aplicação.

Essa evolução demonstra a transição de um ambiente de aprendizado para um padrão mais próximo de produção.

## 🎯 Objetivo

Refinar as permissões IAM da aplicação, substituindo permissões amplas por permissões mínimas necessárias para acesso ao bucket S3.

## 🏗️ O que foi ajustado

* Remoção de permissões amplas `s3:*`
* Restrição de acesso ao bucket S3 da aplicação
* Permissão específica para listar o bucket
* Permissão específica para leitura e escrita de objetos

## 🧠 Conceitos importantes

* Least Privilege: conceder apenas as permissões necessárias
* IAM Policy: documento que define permissões
* Resource ARN: identifica exatamente quais recursos podem ser acessados
* S3 Bucket ARN: usado para permissões no bucket
* S3 Object ARN: usado para permissões nos objetos do bucket

## ⚙️ Como funciona

A EC2 continua utilizando uma IAM Role para acessar o S3. Porém, a policy foi refinada para permitir apenas ações específicas no bucket da aplicação.

Permissões aplicadas:

* `s3:ListBucket`
* `s3:GetObject`
* `s3:PutObject`

Recursos permitidos:

* `arn:aws:s3:::bucket-da-aplicacao`
* `arn:aws:s3:::bucket-da-aplicacao/*`

## 🔐 Segurança aplicada

* A EC2 não possui mais acesso amplo ao S3
* O acesso fica restrito ao bucket da aplicação
* Não há uso de Access Keys
* Permissões seguem o princípio do menor privilégio

## 📚 Documentação oficial

* https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy
* https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-policy-language-overview.html

## 🧪 Como testar

* Rodar `terraform plan -var-file="dev.tfvars"`
* Rodar `terraform apply -var-file="dev.tfvars"`
* Acessar a aplicação via ALB
* Confirmar que a integração com S3 continua funcionando
* Validar que a policy está restrita ao bucket da aplicação

## 📌 Observações importantes

* Permissões amplas são úteis em laboratório inicial, mas não são recomendadas em produção
* O refinamento de IAM é uma etapa essencial de segurança
* O uso de IAM Role evita credenciais fixas na aplicação

