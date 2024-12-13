provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "flask_app" {
  metadata {
    name = "flask-app"
    labels = {
      app = "flask-app"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "flask-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "flask-app"
        }
      }
      spec {
        container {
          image = "my-flask-app:1.0"
          name  = "flask-app"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "flask_service" {
  metadata {
    name = "flask-service"
  }
  spec {
    selector = {
      app = "flask-app"
    }
    port {
      port        = 80
      target_port = 5000
    }
    type = "ClusterIP"
  }
}
