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

variable "vpc_id" {
  type        = string
  description = "ID da VPC do projeto"
}

variable "oidc" {
  type        = string
  description = "HTTP URL do OIDC provider do EKS cluster"
}

