variable "cidr_block" {
  type        = string
  description = "CIDR Block para network da VPC"
}

variable "project_name" {
  type        = string
  description = "Nome do projeto para user nos recursos que serão criados (Name Tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags dos recursos AWS"
}

# variable "cluster_name" {
#   type        = string
#   description = "Nome do cluster EKS principal para tagging"
# }