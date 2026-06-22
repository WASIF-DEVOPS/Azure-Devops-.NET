resource "random_string" "postgres_suffix" {
  length  = 6
  special = false
  upper   = false
  keepers = {
    location = var.postgres_location
  }
}

resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = "eshop-${var.environment}-pg-${random_string.postgres_suffix.result}"
  resource_group_name    = var.resource_group_name
  location               = var.postgres_location
  version                = "16"
  administrator_login    = "psqladmin"
  administrator_password = var.admin_password
  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768
  backup_retention_days  = 7
}


