variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
output "db_password_output" {
  value     = var.db_password
  sensitive = true
}
