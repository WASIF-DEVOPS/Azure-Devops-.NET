variable "resource_group_name" {
  description = "Name of the resource group to deploy the Key Vault into"
  type        = string
}

variable "location" {
  description = "Azure region for the Key Vault"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}

variable "aks_principal_id" {
  description = "Object ID of the AKS kubelet identity to grant secret read access"
  type        = string
}

variable "db_password" {
  description = "PostgreSQL administrator password to store in Key Vault"
  type        = string
  sensitive   = true
}

variable "redis_password" {
  description = "Redis password to store in Key Vault"
  type        = string
  sensitive   = true
}

variable "rabbitmq_password" {
  description = "RabbitMQ password to store in Key Vault"
  type        = string
  sensitive   = true
}
