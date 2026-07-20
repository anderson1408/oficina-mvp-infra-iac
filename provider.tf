terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Armazena o estado do Terraform com segurança na nuvem da AWS
  backend "s3" {
    bucket = "oficina-mvp-infra-iac"
    key    = "oficina-lab/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}