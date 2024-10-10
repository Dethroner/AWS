output "region" {
  value       = var.region
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "db_subnets" {
  value       = aws_db_subnet_group.db-nonprod.id
}


output "cluster_name" {
  value       = var.eks_cluster_name
}