data "aws_ssm_parameter" "eks_ami_release_version" {
  name = "/aws/service/eks/optimized-ami/${var.vk8s}/amazon-linux-2/recommended/release_version"
}

resource "aws_eks_node_group" "node-ec2" {

#  lifecycle {
#    create_before_destroy = true
#    ignore_changes        = [scaling_config[0].desired_size]
#  }

  cluster_name    = aws_eks_cluster.eks.id
  node_group_name = "dev-ng"
  node_role_arn   = var.policy-ng
  subnet_ids      = var.ids

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

  ami_type       = "AL2_x86_64"
  release_version = nonsensitive(data.aws_ssm_parameter.eks_ami_release_version.value)
  instance_types = [var.instance_types]
  capacity_type  = "ON_DEMAND"
  disk_size      = 40
}
