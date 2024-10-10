provider "aws" {
  region                   = local.region
  shared_credentials_files = ["$USERPROFILE/.aws/credentials"]
  profile                  = "sb"
}

