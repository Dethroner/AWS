terraform {
  backend "s3" {
    bucket                  = "terraform-states-dev-0726"
    dynamodb_table          = "terraform-state-lock-dev"
    key                     = "s3/terraform.tfstate"
    region                  = "eu-central-1"
    shared_credentials_file = "$USERPROFILE/.aws/credentials"
  }
}