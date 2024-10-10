resource "kubernetes_namespace" "create" {
  metadata {
    name = "dev"
  }
}