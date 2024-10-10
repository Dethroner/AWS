variable "eks_cluster_version" {}

variable "eks_cluster_policy" {
  description = "ARN EKS cluster policy"
}

variable "eks_cluster_endpoint_public_access" {
  type        = bool
  default     = true
  description = "Enable or not public access to cluster endpoint"
}

variable "eks_cluster_endpoint_private_access" {
  type        = bool
  default     = true
  description = "Enable or not private access to cluster endpoint"
}

variable "cluster_endpoint_public_access_cidrs" {
  default     = ["0.0.0.0/0"]
  description = "Only Pritunl VPN server will have access to eks endpoint."
}

variable "eks_node_group_policy" {
  description = "ARN EKS node-group policy"
}

variable "instance_types" {
  description = "Type EC2 instances for EKS"
}

variable "settings" {
  type        = map(any)
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values, see https://hub.helm.sh/charts/stable/kube-state-metrics"
}

variable "values" {
  type        = string
  default     = ""
  description = "Additional yaml encoded values which will be passed to the Helm chart."
}

variable "sg" {}