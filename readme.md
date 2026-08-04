# 🛠️ Sistema de Gestão de Oficina Mecânica (Oficina MVP)
### Documentação de Arquitetura, Infraestrutura como Código e CI/CD

---

## 📌 1. Visão Geral do Projeto

O **Oficina MVP** é uma plataforma desenvolvida para automatizar e gerenciar o ciclo de vida completo de atendimentos de uma oficina mecânica. A solução abrange desde a recepção do veículo, geração e aprovação de orçamentos, alocação de mecânicos e execução dos serviços até o controle de inventário de peças e faturamento final.

A arquitetura foi projetada seguindo os princípios de **Domain-Driven Design (DDD)**, conteinerizada com **Docker**, orquestrada em **Amazon EKS (Kubernetes)** e provisionada via **Terraform** com pipelines de **GitHub Actions**.

---

## 🏗️ 2. Infraestrutura como Código (IaC - Terraform)

### 2.1. Estrutura Modular de Pastas

A infraestrutura foi organizada em módulos reutilizáveis e isolados:

```text
oficina-mvp-infra-iac/
├── modules/
│   ├── ecr/
│   │   ├── main.tf        # Repositório Amazon ECR
│   │   ├── variables.tf   # Variáveis do módulo ECR
│   │   └── outputs.tf     # URL e ARN do repositório ECR
│   └── eks/
│       ├── main.tf        # Cluster EKS e Managed Node Group
│       ├── variables.tf   # Variáveis do módulo EKS
│       └── outputs.tf     # Endpoints e Autoridade Certificadora
├── backend.tf             # Estado remoto do Terraform no S3
├── providers.tf           # Configuração de provedores (AWS ~> 5.0)
├── data.tf                # Data Sources (VPC Default, Subnets e LabRole)
├── main.tf                # Orquestração dos Módulos
├── variables.tf           # Definição de Variáveis Globais
├── terraform.tfvars       # Valores Padrão das Variáveis
├── outputs.tf             # Saídas consolidadas do projeto
└── README.md              # Documentação