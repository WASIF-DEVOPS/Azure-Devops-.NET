resource "azurerm_servicebus_namespace" "rabbitmq" {
  name                = "eshop-${var.environment}-bus"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
}


