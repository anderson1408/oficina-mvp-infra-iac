output "ecr_repository_url" {
  description = "URL do Repositório ECR"
  value       = module.ecr.repository_url
}

output "eks_cluster_name" {
  description = "Nome do Cluster EKS"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint do Cluster EKS"
  value       = module.eks.cluster_endpoint
}

output "load_balancer_endpoint" {
  description = "Endereço do Load Balancer da aplicação"
  # Ajuste o caminho abaixo conforme o nome do seu recurso resource "kubernetes_service" ou "aws_lb"
  value = kubernetes_service.app.status[0].load_balancer[0].ingress[0].hostname
}