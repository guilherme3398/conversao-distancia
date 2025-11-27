variable "project_name" {
  type        = string
  description = "Nome do projeto para user nos recursos que serão criados (Name Tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags dos recursos AWS"
}

variable "public_subnet_1a" {
  type        = string
  description = "Nome do projeto para user nos recursos que serão criados (Name Tag)"
}

variable "public_subnet_1b" {
  type        = string
  description = "Nome do projeto para user nos recursos que serão criados (Name Tag)"
}

       