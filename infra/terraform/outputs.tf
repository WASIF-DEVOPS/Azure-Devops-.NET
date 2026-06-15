output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "aks_kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}

output "postgres_host" {
  value = module.postgres.host
}

output "redis_host" {
  value = module.redis.host
}

output "key_vault_name" {
  value = module.keyvault.key_vault_name
}
