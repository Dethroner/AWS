data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name                              = var.name
  cidr                              = var.cidr
  azs                               = data.aws_availability_zones.available.names
  private_subnets                   = var.private_subnets
  public_subnets                    = var.public_subnets
  enable_nat_gateway                = true
  single_nat_gateway                = true
  enable_dns_hostnames              = true
  instance_tenancy                  = "default"
  map_public_ip_on_launch           = false
  enable_dhcp_options               = true
  # dhcp_options_domain_name        = "internal.service"
  dhcp_options_domain_name_servers  = ["AmazonProvidedDNS", "8.8.8.8", "8.8.4.4"]
  
  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared",
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                 = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"        = "1"
  }
}