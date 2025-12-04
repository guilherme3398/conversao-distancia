data "kubernetes_service" "grafana_lb" {
  metadata {
    name      = "kube-prom-stack-grafana" # Nome padrão do Service do Grafana no Chart
    namespace = "monitoring"
  }
}