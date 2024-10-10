data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket                  = "terraform-states-dev-0726"
    key                     = "vpn/terraform.tfstate"
    region                  = "eu-central-1"
    shared_credentials_file = "$USERPROFILE/.aws/credentials"
  }
}

data "aws_security_group" "default" {
  vpc_id = local.vpc_id
  name   = "default"
}

resource "aws_db_instance" "db" {

  identifier               = "nonprod"
  
  instance_class           = "db.t3.large"
  allocated_storage        = 10
  storage_encrypted        = true
  engine                   = "postgres"
  engine_version           = "16.3"
  port                     = "15432"
  parameter_group_name     = "postgress16"
  
  skip_final_snapshot      = true
  publicly_accessible      = false
  apply_immediately        = true
  ca_cert_identifier       = "rds-ca-rsa4096-g1"
  multi_az                 = false
  
  db_subnet_group_name     = local.db_subnets
  vpc_security_group_ids   = ["${data.aws_security_group.default.id}"]
  
  username                 = local.db_creds.su
  password                 = local.db_creds.supass
  
  maintenance_window       = "sun:00:00-Sun:01:00"
  backup_window            = "01:00-03:00"
  backup_retention_period  = 7
  delete_automated_backups = true

}
  
