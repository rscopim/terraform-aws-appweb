# Fase 8 — Integração da aplicação com S3

## 🎯 Objetivo

Permitir que a aplicação interaja com o Amazon S3, realizando operações de leitura e escrita durante a inicialização das instâncias EC2.

## 🏗️ O que foi criado

* Escrita de arquivo no S3 durante o boot da instância
* Leitura de arquivo do S3 pela aplicação
* Exibição da mensagem na página web
* Validação da integração EC2 → IAM Role → S3

## 🧠 Conceitos importantes

* **IAM Role**: permite que a EC2 acesse serviços AWS sem uso de credenciais estáticas
* **Amazon S3**: serviço de armazenamento de objetos
* **AWS CLI**: utilizada pela instância para interagir com o S3
* **User Data**: script executado automaticamente na inicialização da instância
* **Credenciais temporárias**: fornecidas automaticamente pela AWS para a instância

## ⚙️ Como funciona

Durante a inicialização da instância EC2, o script de User Data executa as seguintes etapas:

1. Cria um arquivo local com uma mensagem
2. Envia o arquivo para o bucket S3
3. Realiza o download do arquivo a partir do S3
4. Exibe o conteúdo na página web da aplicação

Esse processo valida que a instância possui permissões corretas para interagir com o S3 via IAM Role.

Fluxo de integração:

```text id="fj5g7m"
EC2 (User Data)
   ↓
IAM Role
   ↓
Amazon S3 (Upload / Download)
   ↓
Aplicação Web (exibição da mensagem)
```

## 🔐 Segurança aplicada

* Uso de IAM Role em vez de Access Keys
* Credenciais temporárias gerenciadas pela AWS
* Acesso ao S3 controlado via políticas IAM
* Nenhuma credencial sensível armazenada na instância

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template

## 🧪 Como testar

* Executar:

```bash id="m4c2pm"
terraform apply
```

* Renovar as instâncias do Auto Scaling Group
* Acessar o DNS do ALB no navegador
* Validar se a mensagem proveniente do S3 está sendo exibida na página
* Verificar no console AWS se o arquivo foi criado no bucket S3

## 📌 Observações importantes

* A execução ocorre apenas no momento de inicialização da instância
* Para execução contínua, seria necessário uso de cron ou aplicação persistente
* Essa integração demonstra comunicação segura entre serviços AWS

## 🚀 Evolução futura

* Refinar permissões IAM (evitar uso de `s3:*`)
* Implementar upload dinâmico via aplicação web
* Utilizar versionamento de objetos no S3
* Integrar com outros serviços como RDS ou Lambda

---

