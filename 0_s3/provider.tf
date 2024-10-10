provider "aws" {
  region                   = var.region
  shared_credentials_files = ["$USERPROFILE/.aws/credentials"]
  profile                  = "sb"
}
