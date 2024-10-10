module "vpc" {
  source              = "./vpc"
  
  name                = var.vpc_name
  cidr                = var.cidr
  private_subnets     = var.private_subnets
  public_subnets      = var.public_subnets
  cluster_name        = var.eks_cluster_name
}

resource "aws_db_subnet_group" "db-nonprod" {
  name       = "db-nonprod"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "db-nonprod"
  }
}