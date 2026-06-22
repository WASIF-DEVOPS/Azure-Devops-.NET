output "host" {
  description = "Name of the Azure Service Bus namespace"
  value       = azurerm_servicebus_namespace.rabbitmq.name
}
