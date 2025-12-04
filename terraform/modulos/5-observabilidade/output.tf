output "grafana_url" {
  description = "URL para acessar o painel do Grafana (LoadBalancer DNS)."
  value = join("", [
    "http://",
    try(
      # Tenta pegar o hostname do Service do Grafana
      data.kubernetes_service.grafana_lb.status[0].load_balancer[0].ingress[0].hostname,
      "Aguardando DNS do Load Balancer..."
    )
  ])
}

output "grafana_password_note" {
  description = "A senha do usuário admin do Grafana deve ser alterada no values.yaml."
  value       = "A senha do Grafana foi definida no values.yaml durante a instalação do Helm. Use 'admin' como usuário."
}