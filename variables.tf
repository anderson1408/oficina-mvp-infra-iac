variable "aws_region" {
  description = "Região AWS padrão"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome base do projeto"
  type        = string
  default     = "oficina-mecnica-lab"
}

variable "environment" {
  description = "Ambiente de execução"
  type        = string
  default     = "lab"
}