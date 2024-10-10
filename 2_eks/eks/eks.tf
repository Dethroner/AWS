resource "aws_eks_cluster" "eks" {
  
  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler",
  ]
  
  name     = var.cluster_name
  role_arn = var.policy
  version  = var.vk8s

  vpc_config {
    subnet_ids                   = var.ids
    security_group_ids           = var.sg
    endpoint_public_access       = var.public_access
    endpoint_private_access      = var.private_access
    public_access_cidrs          = var.public_access_cidrs
  }
  
#  kubernetes_network_config {
#    ip_family                    = "ipv4"
#    service_ipv4_cidr            = var.vpc
#  }
}
