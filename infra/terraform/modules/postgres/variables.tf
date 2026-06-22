variable "resource_group_name" {
  description = "Name of the resource group to deploy PostgreSQL into"
  type        = string
}

variable "location" {
  description = "Azure region (used as fallback)"
  type        = string
}

variable "postgres_location" {
  description = "Azure region for the PostgreSQL Flexible Server (may differ from primary location)"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the PostgreSQL server"
  type        = string
  sensitive   = true
}
