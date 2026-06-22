variable "resource_group_name" {
  description = "Name of the resource group to deploy the Service Bus into"
  type        = string
}

variable "location" {
  description = "Azure region for the Service Bus namespace"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}
