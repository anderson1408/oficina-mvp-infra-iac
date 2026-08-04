# Busca a LabRole nativa fornecida pelo ambiente de laboratório (VocLabs)
data "aws_iam_role" "lab_role" {
  name = "LabRole"
}