output "eks-endpoint" {
    value = module.eks.eks-endpoint
}

output "kubeconfig-certificate-authority-data" {
    value = module.eks.kubeconfig-certificate-authority-data
}