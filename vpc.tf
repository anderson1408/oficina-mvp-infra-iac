# Busca a VPC padrão (Default VPC) existente na conta do lab
data "aws_vpc" "default" {
  default = true
}

# Busca automaticamente as Subnets da VPC default EXCLUINDO a zona us-east-1e
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  # Filtro mágico: Garante que NENHUMA subnet retornado pertença à AZ 'us-east-1e'
  filter {
    name   = "availability-zone"
    values = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1f"]
  }
}

# Outputs para checagem visual no terminal
output "default_vpc_id" {
  value       = data.aws_vpc.default.id
  description = "ID da VPC Default do Lab"
}

output "filtered_subnet_ids" {
  value       = data.aws_subnets.default.ids
  description = "IDs das Subnets válidas para o EKS control plane"
}