variable "project_name" {
  type        = string
  description = "Nome do projeto para user nos recursos que serão criados (Name Tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags dos recursos AWS"
}

variable "cluster_name" {
  type        = string
  description = "Nome do Cluster EKS"
}

variable "subnet_priv_1a" {
  type        = string
  description = "ID da Subnet privada 1a"
}

variable "subnet_priv_1b" {
  type        = string
  description = "ID da Subnet privada 1b"
}