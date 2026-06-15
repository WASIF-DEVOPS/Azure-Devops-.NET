resource "azurerm_servicebus_namespace" "rabbitmq" {
  name                = "eshop-${var.environment}-sb"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
}

variable "resource_group_name" {}
variable "location" {}
variable "environment" {}

output "host" { value = azurerm_servicebus_namespace.rabbitmq.name }
