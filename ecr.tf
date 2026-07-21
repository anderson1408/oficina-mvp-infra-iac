resource "aws_ecr_repository" "repo" {
  name                 = var.project_name
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "Lab"
  }
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.repo.repository_url
  description = "URL do seu Container Registry (ECR)"
}
