# ==============================================================================
# 1. BUSCA A ROLE PRÉ-CRIADA DO AWS LAB (VocLabs)
# ==============================================================================
# Em ambientes de Lab, não podemos criar novas Roles. Usamos a 'LabRole' existente.
data "aws_iam_role" "lab_role" {
  name = "LabRole"
}

# ==============================================================================
# 2. DEFINIÇÃO DO CLUSTER EKS
# ==============================================================================
resource "aws_eks_cluster" "main" {
  name = "${var.project_name}-cluster"

  # Usa a role nativa do Lab em vez de tentar criar uma nova
  role_arn = data.aws_iam_role.lab_role.arn

  vpc_config {
    # Utiliza as Subnets descobertas automaticamente na VPC Default (vpc.tf)
    subnet_ids = data.aws_subnets.default.ids
  }
}

# ==============================================================================
# 3. DEFINIÇÃO DO NODE GROUP (MÁQUINAS QUE EXECUTAM OS PODS)
# ==============================================================================
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project_name}-node-group"

  # Os nós (máquinas) também usam a mesma LabRole existente
  node_role_arn = data.aws_iam_role.lab_role.arn

  # Aloca as máquinas nas subnets da VPC Default
  subnet_ids = data.aws_subnets.default.ids

  # Configuração de Auto-Scaling básica para Laboratório
  scaling_config {
    desired_size = 2 # Começa com 2 máquinas ativas
    max_size     = 3 # Permite escalar até 3 se houver sobrecarga
    min_size     = 1 # Mantém no mínimo 1 máquina viva
  }

  # Instância custo-benefício para Lab
  instance_types = ["t3.medium"]

  depends_on = [
    aws_eks_cluster.main
  ]
}