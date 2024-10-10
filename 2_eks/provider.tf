provider "aws" {
  region                   = local.region
  shared_credentials_files = ["$USERPROFILE/.aws/credentials"]
  profile                  = "sb"
}


data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "helm" {
  kubernetes {
    host                   = module.eks.eks-endpoint
    cluster_ca_certificate = base64decode(module.eks.kubeconfig-certificate-authority-data)
    token                  = data.aws_eks_cluster_auth.cluster.token
    #config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  host                   = module.eks.eks-endpoint
  cluster_ca_certificate = base64decode(module.eks.kubeconfig-certificate-authority-data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  #load_config_file = "true"
  #config_path = "~/.kube/config"

}

provider "kubectl" {
  host                   = module.eks.eks-endpoint
  cluster_ca_certificate = base64decode(module.eks.kubeconfig-certificate-authority-data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  #config_path = "~/.kube/config"
}