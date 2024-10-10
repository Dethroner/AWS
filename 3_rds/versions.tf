terraform {

  backend "s3" {
    bucket                  = "terraform-states-dev-0726"
    dynamodb_table          = "terraform-state-lock-dev"
    key                     = "rds/terraform.tfstate"
    region                  = "eu-central-1"
    shared_credentials_file = "$USERPROFILE/.aws/credentials"
  }

  required_providers {
    
    aws = {
      source  = "hashicorp/aws"
#      version = "<= 4.60.0"
    }
  
  }
  required_version = ">= 0.14"
}
