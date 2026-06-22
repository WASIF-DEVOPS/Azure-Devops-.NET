output "host" {
  description = "Fully qualified domain name of the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.postgres.fqdn
}
