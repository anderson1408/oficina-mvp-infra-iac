variable "repository_name" {
  description = "Nome do repositório ECR"
  type        = string
  default     = "oficina-mecnica-lab"
}

variable "tags" {
  description = "Tags padrões dos recursos"
  type        = map(string)
  default     = {}
}