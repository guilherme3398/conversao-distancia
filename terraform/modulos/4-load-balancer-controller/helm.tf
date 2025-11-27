resource "helm_release" "eks_helm_controler" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  #version    = "6.0.1"
  namespace = "kube-system" #deploy do chart precisa sser feito na kube system

  depends_on = [
    kubernetes_service_account.eks_controller_sa
  ]

  set = [
    {
      name  = "clusterName"
      value = var.cluster_name
    },

    {
      name  = "serviceAccount.create"
      value = "false"
    },

    {
      name  = "serviceAccount.name"
      value = "aws-load-balancer-controller"
      type  = "string"
    },

    {
      name  = "region"
      value = data.aws_region.current.name
    },
    {
      name  = "vpcId"
      value = var.vpc_id
    }
  ]
}