output "id" {
  value       = aws_db_instance.db.id
  description = "The database instance ID"
}

output "endpoint" {
  value       = aws_db_instance.db.endpoint
  description = "Public DNS name and port separated by a colon"
}