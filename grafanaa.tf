
resource "kubernetes_deployment" "grafana" {
  metadata {
    name = "grafana"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "grafana"
      }
    }

    template {
      metadata {
        labels = {
          app = "grafana"
        }
      }

      spec {
        container {
          name  = "grafana"
          image = var.grafana_image  # Replace with your Grafana image

          #port {
            #container_port = 80
          #} 
        }
        
        }
      }
    }
  }


resource "kubernetes_service" "grafana" {
  metadata {
    name = "grafana"
  }

  spec {
    selector = {
      app = "grafana"
    }

    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"  # Adjust if needed (e.g., ClusterIp)
  }
}

output "grafana_url" {
  value = format("http://<EXTERNAL_IP>:%d", 80)
}