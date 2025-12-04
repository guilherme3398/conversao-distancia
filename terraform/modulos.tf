module "eks_network" {
  source       = "./modulos/1-network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source           = "./modulos/2-cluster"
  project_name     = var.project_name
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b
  tags             = local.tags

}

module "eks_node_group" {
  source         = "./modulos/3-managed-node-group"
  project_name   = var.project_name
  cluster_name   = module.eks_cluster.cluster_name
  subnet_priv_1a = module.eks_network.subnet_priv_1a
  subnet_priv_1b = module.eks_network.subnet_priv_1b
  tags           = local.tags

}

module "eks_load_balancer_controller" {
  source       = "./modulos/4-load-balancer-controller"
  project_name = var.project_name
  cluster_name = module.eks_cluster.cluster_name
  tags         = local.tags
  oidc         = module.eks_cluster.oidc
  vpc_id       = module.eks_network.vpc_id

depends_on = [
  module.eks_cluster,
  module.eks_node_group
]
}

module "observabilidade" {
  source                 = "./modulos/5-observabilidade"
  project_name           = var.project_name
  tags                   = local.tags
  cluster_name           = module.eks_cluster.cluster_name
  cluster_endpoint       = module.eks_cluster.endpoint
  eks_managed_node_group_id = module.eks_node_group.node_group_id
  # Depende explicitamente do Load Balancer Controller e dos Nodes
  depends_on = [
    module.eks_load_balancer_controller
  ]
}