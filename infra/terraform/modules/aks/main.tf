resource "azurerm_kubernetes_cluster" "aks" {
  name                = "eshop-${var.environment}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "eshop-${var.environment}"

  default_node_pool {
    name       = "system"
    node_count = 1
    vm_size    = "Standard_D2s_v7"
  }

  identity {
    type = "SystemAssigned"
  }

  oidc_issuer_enabled       = true
  workload_identity_enabled = true
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}

variable "resource_group_name" {}
variable "location" {}
variable "environment" {}
variable "acr_id" {}

output "kube_config"      { value = azurerm_kubernetes_cluster.aks.kube_config_raw }
output "aks_principal_id" { value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id }
