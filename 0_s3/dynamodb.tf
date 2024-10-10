resource "aws_dynamodb_table" "table0" {
  name           = "terraform-state-lock-0_all"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }

  tags = {
    Name        = "sb"
    Environment = "dev"
  }
}

resource "aws_dynamodb_table" "table1" {
  name           = "terraform-state-lock-prod"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }

  tags = {
    Name        = "sb"
    Environment = "prod"
  }
}