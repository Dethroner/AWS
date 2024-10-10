locals {
  kube_prometheus_stack = {
    name          = local.helm_releases[index(local.helm_releases.*.id, "prometheus")].id
    enabled       = local.helm_releases[index(local.helm_releases.*.id, "prometheus")].enabled
    chart         = local.helm_releases[index(local.helm_releases.*.id, "prometheus")].chart
    repository    = local.helm_releases[index(local.helm_releases.*.id, "prometheus")].repository
    chart_version = local.helm_releases[index(local.helm_releases.*.id, "prometheus")].chart_version
    namespace     = local.helm_releases[index(local.helm_releases.*.id, "prometheus")].namespace
  }
}

resource "helm_release" "monitoring" {

  depends_on = [module.eks]

  count = local.kube_prometheus_stack.enabled ? 1 : 0

  create_namespace = true
  namespace        = local.kube_prometheus_stack.namespace

  name        = local.kube_prometheus_stack.name
  chart       = local.kube_prometheus_stack.chart
  repository  = local.kube_prometheus_stack.repository
  version     = local.kube_prometheus_stack.chart_version
  
  values = [
    var.values
  ]

  dynamic "set" {
    for_each = var.settings
    content {
      name  = set.key
      value = set.value
    }
  }
}
