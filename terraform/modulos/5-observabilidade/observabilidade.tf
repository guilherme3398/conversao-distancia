resource "helm_release" "prometheus_stack" {
  name             = "monitoring-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring" # Namespace dedicado para observabilidade
  create_namespace = true
  version          = "57.0.0" # Use uma versão recente estável

  # O Chart Kube Prometheus Stack já configura automaticamente a descoberta de pods
  # com as anotações: prometheus.io/scrape: "true"

  set = [ 
    {
    name  = "prometheus.prometheusSpec.clusterExternalUrl"
    value = var.cluster_endpoint # URL para Prometheus saber onde está
  },
  
  # Força o Service do Grafana a ser LoadBalancer para acesso externo
   {
    name  = "grafana.service.type"
    value = "LoadBalancer"
  },

  # Passa o nome do cluster para tags e configuração
  {
    name  = "prometheus.prometheusSpec.externalLabels.cluster"
    value = var.cluster_name
  } ]

  # Aplica as configurações personalizadas
  values = [
    file("${path.module}/values.yaml")
  ]
}
