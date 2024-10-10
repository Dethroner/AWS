terraform {

  backend "s3" {
    bucket                  = "terraform-states-dev-0726"
    dynamodb_table          = "terraform-state-lock-dev"
    key                     = "eks/terraform.tfstate"
    region                  = "eu-central-1"
    shared_credentials_file = "$USERPROFILE/.aws/credentials"
  }

  required_providers {
    
    aws = {
      source  = "hashicorp/aws"
      version = "<= 4.60.0"
    }
  
    kubernetes = {
      source  = "hashicorp/kubernetes"
      #version = ">= 2.11.0"
    }

    helm = {
      source  = "hashicorp/helm"
      #version = ">= 2.6.0"
    }
    
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "<= 1.14.0"
    }
  }
  required_version = ">= 0.14"
}
