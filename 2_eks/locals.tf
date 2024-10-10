locals {
  region                = data.terraform_remote_state.vpc.outputs.region
  vpc_id                = data.terraform_remote_state.vpc.outputs.vpc_id
  private_subnets       = data.terraform_remote_state.vpc.outputs.private_subnets
  eks_cluster_name      = data.terraform_remote_state.vpc.outputs.cluster_name
  
  helm_releases = yamldecode(file("${path.module}/helm-releases.yaml"))["releases"]
}