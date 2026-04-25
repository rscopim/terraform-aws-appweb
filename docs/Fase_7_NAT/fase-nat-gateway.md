# Fase 7 — NAT Gateway e rotas privadas

## 🎯 Objetivo

Permitir que instâncias em subnets privadas tenham acesso de saída à internet, sem ficarem expostas diretamente ao público.

## 🏗️ O que foi criado

* Elastic IP (EIP)
* NAT Gateway
* Route Table privada
* Rota padrão (`0.0.0.0/0`) apontando para o NAT Gateway
* Associação das subnets privadas à Route Table privada

## 🧠 Conceitos importantes

* **NAT Gateway**: permite que instâncias em subnets privadas acessem a internet sem receber conexões externas
* **Elastic IP (EIP)**: IP público fixo associado ao NAT Gateway
* **Route Table privada**: define o caminho do tráfego das subnets privadas
* **Subnet privada**: não possui acesso direto da internet
* **Rota padrão (0.0.0.0/0)**: direciona todo o tráfego externo para o NAT

## ⚙️ Como funciona

O NAT Gateway é provisionado em uma subnet pública e recebe um Elastic IP.

As subnets privadas passam a utilizar uma Route Table própria, que contém uma rota padrão (`0.0.0.0/0`) apontando para o NAT Gateway.

Dessa forma, as instâncias privadas conseguem:

* instalar pacotes
* atualizar o sistema
* acessar serviços externos

sem estarem acessíveis diretamente pela internet.

Fluxo de saída:

```text
EC2 (subnet privada)
   ↓
Route Table privada
   ↓
NAT Gateway
   ↓
Internet
```

Fluxo de entrada (bloqueado):

```text
Internet → ❌ EC2 (subnet privada)
```

## 🔐 Segurança aplicada

* Instâncias privadas não possuem IP público
* Não há acesso direto da internet para as subnets privadas
* O NAT permite apenas tráfego de saída
* Isolamento entre camada pública e privada

## 📚 Documentação oficial

* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

## 🧪 Como testar

* Executar:

```bash
terraform apply
```

* Validar no console AWS:

  * NAT Gateway criado e disponível
  * Elastic IP associado
  * Route Table privada com rota `0.0.0.0/0` apontando para o NAT
  * Subnets privadas associadas à Route Table correta

## 📌 Observações importantes

* O NAT Gateway é necessário para que instâncias privadas acessem a internet
* Esse recurso gera custo e deve ser utilizado com controle
* A separação entre subnets públicas e privadas é essencial em arquiteturas seguras

## 🚀 Evolução futura

* Integrar Auto Scaling Group com subnets privadas
* Utilizar NAT Gateway apenas quando necessário (controle de custo)
* Implementar VPC Endpoints para reduzir dependência do NAT
* Melhorar segurança com Network ACLs e regras mais específicas

