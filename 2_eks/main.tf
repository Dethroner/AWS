data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket                  = "terraform-states-dev-0726"
    key                     = "vpn/terraform.tfstate"
    region                  = "eu-central-1"
    shared_credentials_file = "$USERPROFILE/.aws/credentials"
  }
}

module "eks" {
  
  source              = "./eks"
  
  cluster_name        = local.eks_cluster_name
  vk8s                = var.eks_cluster_version
  vpc                 = "172.16.0.0/12"                                 # It only allows 10.0.0.0/8, 172.16.0.0/12 or 192.168.0.0/16 values.
  ids                 = flatten([local.private_subnets])
  sg                  = var.sg
  policy              = var.eks_cluster_policy
  public_access       = var.eks_cluster_endpoint_public_access
  public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  private_access      = var.eks_cluster_endpoint_private_access
    
  policy-ng           = var.eks_node_group_policy
  instance_types      = var.instance_types
}

