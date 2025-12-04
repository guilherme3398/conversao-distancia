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

variable "cluster_endpoint" {
  description = "O endpoint da API do EKS, usado para configurar o Prometheus (clusterExternalUrl)."
  type        = string
}

variable "eks_managed_node_group_id" {
  description = "ID do Node Group (para dependência implícita de que os nodes estão prontos)."
  type        = string
}