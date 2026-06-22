variable "resource_group_name" {
  description = "Name of the resource group to deploy the AKS cluster into"
  type        = string
}

variable "location" {
  description = "Azure region for the AKS cluster"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}

variable "acr_id" {
  description = "Resource ID of the ACR to grant AcrPull role to the AKS kubelet identity"
  type        = string
}
