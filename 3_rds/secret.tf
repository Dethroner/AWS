data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "prod/db"
}

locals {
  db_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}