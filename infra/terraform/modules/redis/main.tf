resource "azurerm_redis_cache" "redis" {
  name                = "eshop-${var.environment}-redis"
  resource_group_name = var.resource_group_name
  location            = var.location
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
}

variable "resource_group_name" {}
variable "location" {}
variable "environment" {}

output "host" { value = azurerm_redis_cache.redis.hostname }
