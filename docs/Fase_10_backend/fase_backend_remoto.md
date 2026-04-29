# Fase 10 — Backend remoto (S3 + DynamoDB)

## 🎯 Objetivo

Configurar um backend remoto para o Terraform, utilizando Amazon S3 para armazenamento do state e DynamoDB para controle de lock, permitindo maior segurança, consistência e simulação de ambiente real de trabalho em equipe.

---

## 🏗️ O que foi criado

* Bucket S3 para armazenamento do Terraform state
* Versionamento habilitado no bucket
* Criptografia server-side (AES256)
* Tabela DynamoDB para controle de lock do state
* Separação de ambientes (dev e prod) com states independentes

---

## 🧠 Conceitos importantes

* **Terraform State**: arquivo que representa o estado atual da infraestrutura
* **Backend remoto**: armazenamento centralizado do state (S3)
* **Lock de estado (DynamoDB)**: evita concorrência entre execuções simultâneas
* **Separação por ambiente**: cada ambiente possui seu próprio state
* **Consistency & Safety**: evita corrupção do state

---

## ⚙️ Como funciona

O Terraform passa a armazenar o state no S3, em vez de localmente.

Cada ambiente utiliza um caminho específico dentro do bucket:

```text
appweb/dev/terraform.tfstate
appweb/prod/terraform.tfstate
```

Durante execuções (`plan` ou `apply`), o Terraform cria um lock na tabela DynamoDB para impedir que múltiplas operações ocorram simultaneamente.

Fluxo:

```text
Terraform → S3 (state)
          → DynamoDB (lock)
```

---

## 🔐 Segurança aplicada

* Criptografia no bucket S3 (AES256)
* Versionamento ativado (proteção contra perda de state)
* Lock com DynamoDB (evita concorrência)
* Backend separado da aplicação
* Nenhuma credencial sensível armazenada no código

---

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table
* https://developer.hashicorp.com/terraform/language/settings/backends/s3

---

## 🧪 Como testar

1. Inicializar backend DEV:

```bash
terraform init -reconfigure -backend-config="backend-dev.hcl"
```

2. Executar plano:

```bash
terraform plan -var-file="dev.tfvars"
```

3. Executar aplicação:

```bash
terraform apply -var-file="dev.tfvars"
```

4. Verificar no S3:

```text
appweb/dev/terraform.tfstate
```

5. Testar lock:

Abrir dois terminais e executar comandos simultâneos para validar o bloqueio.

---

## 📌 Observações importantes

* O backend remoto não deve ser destruído com frequência
* O bucket de state é diferente do bucket da aplicação
* O DynamoDB é essencial para evitar corrupção do state
* States antigos (antes da separação) podem ser mantidos como backup
* O backend não aceita variáveis diretamente, por isso são usados arquivos `.hcl`

---

## 🚀 Evolução futura

* Uso de múltiplas contas AWS (multi-account)
* Separação por workspace ou ambiente isolado
* Integração com CI/CD (GitHub Actions)
* Criação de políticas IAM específicas para acesso ao backend
* Auditoria e logs do acesso ao state

---
# Fase 10 — Backend remoto (S3 + DynamoDB)

## 🎯 Objetivo

Configurar um backend remoto para o Terraform, utilizando Amazon S3 para armazenamento do state e DynamoDB para controle de lock, permitindo maior segurança, consistência e simulação de ambiente real de trabalho em equipe.

---

## 🏗️ O que foi criado

* Bucket S3 para armazenamento do Terraform state
* Versionamento habilitado no bucket
* Criptografia server-side (AES256)
* Tabela DynamoDB para controle de lock do state
* Separação de ambientes (dev e prod) com states independentes

---

## 🧠 Conceitos importantes

* **Terraform State**: arquivo que representa o estado atual da infraestrutura
* **Backend remoto**: armazenamento centralizado do state (S3)
* **Lock de estado (DynamoDB)**: evita concorrência entre execuções simultâneas
* **Separação por ambiente**: cada ambiente possui seu próprio state
* **Consistency & Safety**: evita corrupção do state

---

## ⚙️ Como funciona

O Terraform passa a armazenar o state no S3, em vez de localmente.

Cada ambiente utiliza um caminho específico dentro do bucket:

```text
appweb/dev/terraform.tfstate
appweb/prod/terraform.tfstate
```

Durante execuções (`plan` ou `apply`), o Terraform cria um lock na tabela DynamoDB para impedir que múltiplas operações ocorram simultaneamente.

Fluxo:

```text
Terraform → S3 (state)
          → DynamoDB (lock)
```

---

## 🔐 Segurança aplicada

* Criptografia no bucket S3 (AES256)
* Versionamento ativado (proteção contra perda de state)
* Lock com DynamoDB (evita concorrência)
* Backend separado da aplicação
* Nenhuma credencial sensível armazenada no código

---

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table
* https://developer.hashicorp.com/terraform/language/settings/backends/s3

---

## 🧪 Como testar

1. Inicializar backend DEV:

```bash
terraform init -reconfigure -backend-config="backend-dev.hcl"
```

2. Executar plano:

```bash
terraform plan -var-file="dev.tfvars"
```

3. Executar aplicação:

```bash
terraform apply -var-file="dev.tfvars"
```

4. Verificar no S3:

```text
appweb/dev/terraform.tfstate
```

5. Testar lock:

Abrir dois terminais e executar comandos simultâneos para validar o bloqueio.

---

## 📌 Observações importantes

* O backend remoto não deve ser destruído com frequência
* O bucket de state é diferente do bucket da aplicação
* O DynamoDB é essencial para evitar corrupção do state
* States antigos (antes da separação) podem ser mantidos como backup
* O backend não aceita variáveis diretamente, por isso são usados arquivos `.hcl`

---

## 🚀 Evolução futura

* Uso de múltiplas contas AWS (multi-account)
* Separação por workspace ou ambiente isolado
* Integração com CI/CD (GitHub Actions)
* Criação de políticas IAM específicas para acesso ao backend
* Auditoria e logs do acesso ao state

---
