output "eks-endpoint" {
    value = aws_eks_cluster.eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
    value = aws_eks_cluster.eks.certificate_authority[0].data
}

output "cluster_id" {
  description = "List of IDs of public subnets"
  value       = aws_eks_cluster.eks.id
}
