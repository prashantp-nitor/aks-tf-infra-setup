resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.prefix}-aks"
  kubernetes_version  = var.kubernetes_version
  node_resource_group = "${var.prefix}-aks-nodes-rg"
  sku_tier            = var.aks_sku_tier

  default_node_pool {
    name                         = "system"
    vm_size                      = var.system_node_vm_size
    node_count                   = var.system_node_count
    min_count                    = var.system_node_min_count
    max_count                    = var.system_node_max_count
    auto_scaling_enabled         = true
    type                         = "VirtualMachineScaleSets"
    os_disk_size_gb              = 60
    os_disk_type                 = "Managed"
    vnet_subnet_id               = var.aks_subnet_id
    only_critical_addons_enabled = true
    temporary_name_for_rotation  = "tmppool"

    node_labels = {
      "nodepool-type" = "system"
      "environment"   = var.environment
    }

    tags = var.tags
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    service_cidr      = var.service_cidr
    dns_service_ip    = var.dns_service_ip
    outbound_type     = "loadBalancer"
    load_balancer_sku = "standard"
  }

  local_account_disabled    = false
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  tags = var.tags

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count,
      kubernetes_version,
    ]
  }
}
