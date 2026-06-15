resource "azurerm_container_registry" "acr" {
  name                = "eshop${var.environment}acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
}

variable "resource_group_name" {}
variable "location" {}
variable "environment" {}

output "acr_id"           { value = azurerm_container_registry.acr.id }
output "acr_login_server" { value = azurerm_container_registry.acr.login_server }
