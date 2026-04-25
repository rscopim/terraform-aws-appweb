# Fase 2 — S3 (Armazenamento)

## 🎯 Objetivo

Criar um bucket Amazon S3 com nome único para armazenamento de dados da aplicação e integração com outros serviços da arquitetura.

---

## 🏗️ O que foi criado

* Bucket S3
* Nome único utilizando `random_id`
* Estrutura preparada para integração com a aplicação

---

## 🧠 Conceitos importantes

* **Amazon S3 (Simple Storage Service)**: serviço de armazenamento de objetos altamente escalável
* **Bucket**: container lógico onde os objetos (arquivos) são armazenados
* **Nome global**: buckets possuem nomes únicos em toda a AWS (não apenas na conta)
* **random_id**: recurso do Terraform utilizado para gerar identificadores aleatórios, evitando conflitos de nome

---

## ⚙️ Como funciona

O nome do bucket é gerado dinamicamente utilizando o nome do projeto combinado com um sufixo aleatório.

Isso garante que o nome seja único globalmente, evitando falhas na criação do recurso.

Exemplo de padrão gerado:

```text id="1z0vbi"
terraform-appweb-bucket-<random_id>
```

O bucket será utilizado nas próximas fases para:

* armazenamento de arquivos da aplicação
* integração com instâncias EC2 via IAM Role
* testes de leitura e escrita

---

## 🔐 Segurança aplicada

* Nome único para evitar conflitos globais
* Acesso ao bucket será controlado via IAM Role (sem uso de credenciais estáticas)
* Bucket não exposto publicamente por padrão

---

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
* https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id

---

## 🧪 Como testar

* Listar buckets via AWS CLI:

```bash id="f2d7is"
aws s3 ls
```

* Verificar o bucket criado no console AWS
* Confirmar que o nome contém o sufixo aleatório
* Validar que o bucket está acessível dentro da conta

---

## 📌 Observações importantes

* Buckets S3 possuem nomes globais — duplicidade causa erro na criação
* O uso de `random_id` é essencial em ambientes compartilhados ou testes
* O bucket será utilizado nas próximas fases para integração com EC2

---

## 🚀 Evolução futura

* Configuração de políticas de acesso específicas (IAM Policy)
* Integração com a aplicação para upload/download de arquivos
* Uso de versionamento para controle de mudanças
* Implementação de ciclo de vida (Lifecycle Rules) para otimização de custo

---

