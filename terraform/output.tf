output "resource_group_name" {
  description = "Name of the resource group"
  value       = data.azurerm_resource_group.rg.name
}

output "aks_name" {
  description = "Name of the AKS cluster"
  value       = module.aks.cluster_name
}

output "kube_config" {
  description = "Raw admin kubeconfig"
  value       = module.aks.kube_admin_config_raw
  sensitive   = true
}

output "acr_name" {
  description = "Name of the Azure Container Registry"
  value       = module.acr.acr_name
}

output "acr_login_server" {
  description = "ACR login server URL"
  value       = module.acr.login_server
}

output "oidc_issuer_url" {
  description = "AKS OIDC issuer URL for workload identity"
  value       = module.aks.oidc_issuer_url
}
