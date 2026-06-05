resource "azurerm_kubernetes_cluster_node_pool" "this" {
  name                  = var.name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  vm_size               = var.vm_size
  min_count             = var.min_count
  max_count             = var.max_count
  auto_scaling_enabled  = true
  os_disk_size_gb       = 60
  os_disk_type          = "Ephemeral"
  vnet_subnet_id        = var.subnet_id
  mode                  = "User"

  node_labels = {
    "nodepool-type" = var.name
    "environment"   = var.environment
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [node_count]
  }
}
