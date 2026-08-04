# Busca a VPC Padrão do Lab
data "aws_vpc" "default" {
  default = true
}

# Filtra dinamicamente as subnets ativas ignorando us-east-1e (incompatível com EKS)
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "availability-zone"
    values = [for az in ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1f"] : az]
  }
}

