resource "aws_eks_addon" "addons" {
  cluster_name      = var.cluster_name
  addon_name        = "aws-ebs-csi-driver"
  addon_version     = "v1.30.0-eksbuild.1"
  service_account_role_arn = "arn:aws:iam::252509208734:role/AmazonEKS_EBS_CSI_DriverRoleNew"
  resolve_conflicts = "OVERWRITE"
}
