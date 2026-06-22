resource "random_string" "redis_suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_redis_cache" "redis" {
  name                = "eshop-${var.environment}-${random_string.redis_suffix.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
}


