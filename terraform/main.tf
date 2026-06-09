data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "network" {
  source = "./modules/network"

  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  prefix              = var.prefix
  vnet_address_space  = var.vnet_address_space
  aks_subnet_cidr     = var.aks_subnet_cidr
  tags                = local.tags
}

module "aks" {
  source = "./modules/aks"

  resource_group_name   = data.azurerm_resource_group.rg.name
  location              = data.azurerm_resource_group.rg.location
  prefix                = var.prefix
  environment           = var.environment
  kubernetes_version    = var.kubernetes_version
  aks_sku_tier          = var.aks_sku_tier
  aks_subnet_id         = module.network.aks_subnet_id
  service_cidr          = var.service_cidr
  dns_service_ip        = var.dns_service_ip
  system_node_vm_size   = var.system_node_vm_size
  system_node_count     = var.system_node_count
  system_node_min_count = var.system_node_min_count
  system_node_max_count = var.system_node_max_count
  tags                  = local.tags
}

module "user_node_pool" {
  source = "./modules/node-pool"

  name                  = "user"
  kubernetes_cluster_id = module.aks.cluster_id
  vm_size               = var.user_node_vm_size
  min_count             = var.user_node_min_count
  max_count             = var.user_node_max_count
  subnet_id             = module.network.aks_subnet_id
  environment           = var.environment
  tags                  = local.tags
}

# Using Docker Hub instead of ACR — no Azure role assignment permission required
