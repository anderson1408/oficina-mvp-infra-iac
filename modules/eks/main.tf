resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.lab_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = var.tags
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = var.lab_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.desired_size + 1
    min_size     = 1
  }

  instance_types = var.instance_types

  tags = var.tags
}