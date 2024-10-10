sg                  = ["sg-123456789"]
eks_cluster_version = "1.30"
eks_cluster_policy  = "arn:aws:iam::123456789:role/eksctl-sb-cluster-ServiceRole"
cluster_endpoint_public_access_cidrs = [
  "192.1686.119.1/28", # eu
  "10.10.100.150/32",  # group gitlab-runner
  "10.10.100.100/32"   # Jenkins
]
eks_node_group_policy = "arn:aws:iam::123456789:role/eksctl-sb-nodegroup-NodeInstanceRole"
instance_types        = "t3a.2xlarge"            # (2n-2) micro -4, small -12, medium -18, large -36, xlarge\2xlarge -60 