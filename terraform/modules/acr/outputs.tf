output "acr_id" {
  description = "Resource ID of the container registry"
  value       = azurerm_container_registry.acr.id
}

output "acr_name" {
  description = "Name of the container registry"
  value       = azurerm_container_registry.acr.name
}

output "login_server" {
  description = "Login server URL (e.g. ppowaracr.azurecr.io)"
  value       = azurerm_container_registry.acr.login_server
}
