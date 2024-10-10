locals {
  region                = data.terraform_remote_state.vpc.outputs.region
  vpc_id                = data.terraform_remote_state.vpc.outputs.vpc_id
  db_subnets            = data.terraform_remote_state.vpc.outputs.db_subnets
}