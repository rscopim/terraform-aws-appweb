# Fase 10.1 — S3 Native Locking (Substituindo DynamoDB)

## 🎯 Objetivo

Migrar o mecanismo de controle de concorrência do Terraform (state locking) de DynamoDB para o modelo nativo do S3 (`use_lockfile = true`), alinhando o projeto com as práticas mais atuais recomendadas pelo Terraform.

---

## 🏗️ O que foi ajustado

* Remoção do uso de tabela DynamoDB para lock
* Ativação do lock nativo do S3 (`use_lockfile = true`)
* Atualização dos arquivos `backend-dev.hcl` e `backend-prod.hcl`
* Manutenção do bucket S3 como backend do state
* Validação da migração em ambientes DEV e PROD

---

## 🧠 Conceitos importantes

* **Terraform State**: arquivo que representa o estado atual da infraestrutura
* **State Locking**: mecanismo que evita execuções simultâneas do Terraform
* **S3 Native Locking**: controle de lock diretamente no bucket S3
* **DynamoDB Lock (legado)**: modelo antigo de lock que está sendo descontinuado
* **Concorrência**: execução simultânea que pode corromper o state

---

## ⚙️ Como funciona

Anteriormente, o Terraform utilizava uma tabela DynamoDB para controlar o lock do state.

Nesta fase, o controle de concorrência passa a ser feito diretamente pelo S3, utilizando arquivos de lock gerenciados automaticamente.

Configuração aplicada:

```hcl
bucket       = "terraform-backend-appweb-tfstate-rscopim"
key          = "appweb/dev/terraform.tfstate"
region       = "us-west-2"
encrypt      = true
use_lockfile = true
```

Fluxo:

```text
Terraform → S3 (state + lockfile)
```

---

## 🔐 Segurança aplicada

* Evita execução simultânea do Terraform
* Protege o state contra corrupção
* Remove dependência de serviço externo (DynamoDB)
* Simplifica a arquitetura de backend
* Mantém criptografia do state no S3

---

## 📚 Documentação oficial

* https://developer.hashicorp.com/terraform/language/backend/s3
* https://docs.aws.amazon.com/prescriptive-guidance/latest/terraform-aws-provider-best-practices/backend.html

---

## 🧪 Como testar

1. Reconfigurar backend:

```bash
terraform init -reconfigure -backend-config="backend-dev.hcl"
```

2. Executar plano:

```bash
terraform plan -var-file="dev.tfvars"
```

3. Executar apply:

```bash
terraform apply -var-file="dev.tfvars"
```

4. (Opcional) Simular concorrência:

Abrir dois terminais e rodar `terraform apply` simultaneamente para validar o lock.

---

## 📌 Observações importantes

* O DynamoDB Lock está sendo descontinuado pelo Terraform
* O uso de `use_lockfile = true` é o padrão mais atual
* A tabela DynamoDB pode ser mantida temporariamente como fallback
* Após validação completa, a tabela pode ser removida
* O backend continua sendo o S3 (apenas o mecanismo de lock mudou)

---

## 🚀 Evolução futura

* Remoção definitiva da tabela DynamoDB
* Implementação de controle de acesso ao bucket do state (IAM)
* Auditoria de acesso ao state (CloudTrail)
* Integração com pipelines CI/CD

---

## 🔄 Evolução da arquitetura

Modelo anterior:

```text
Terraform → S3 (state)
          → DynamoDB (lock)
```

Modelo atual:

```text
Terraform → S3 (state + lockfile)
```

Essa evolução simplifica a arquitetura, reduz dependências e segue as práticas mais modernas do Terraform.
