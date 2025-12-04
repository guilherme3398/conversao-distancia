output "node_group_id" {
  description = "ID do grupo de nós gerenciado (usado para forçar a ordem de dependência)."
  value       = aws_eks_node_group.eks_node_group.id
}