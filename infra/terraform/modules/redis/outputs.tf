output "host" {
  description = "Hostname of the Azure Redis Cache instance"
  value       = azurerm_redis_cache.redis.hostname
}
