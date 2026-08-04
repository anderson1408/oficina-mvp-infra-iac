variable "repository_name" {
  description = "Nome do repositório ECR"
  type        = string
}

variable "tags" {
  description = "Tags padrões dos recursos"
  type        = map(string)
  default     = {}
}