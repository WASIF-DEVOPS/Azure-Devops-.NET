output "kube_config" {
  description = "Raw kubeconfig for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "aks_principal_id" {
  description = "Object ID of the AKS kubelet managed identity"
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
