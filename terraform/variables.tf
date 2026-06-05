variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  default     = "centralindia"
}

variable "prefix" {
  description = "Prefix for all resource names"
  default     = "ppowar"
}

variable "environment" {
  description = "Environment name (dev / staging / prod)"
  default     = "dev"
}

variable "kubernetes_version" {
  description = "Kubernetes version — null uses latest stable"
  type        = string
  default     = null
}

variable "aks_sku_tier" {
  description = "AKS SLA tier: Free or Paid (Uptime SLA)"
  default     = "Free"
}

# ── System node pool ──────────────────────────────────────────────────────────
variable "system_node_vm_size" {
  description = "VM size for the system node pool"
  default     = "Standard_D2s_v3"
}

variable "system_node_count" {
  description = "Initial node count for system pool"
  default     = 1
}

variable "system_node_min_count" {
  description = "Minimum nodes in system pool"
  default     = 1
}

variable "system_node_max_count" {
  description = "Maximum nodes in system pool"
  default     = 3
}

# ── User / workload node pool ─────────────────────────────────────────────────
variable "user_node_vm_size" {
  description = "VM size for the user workload node pool"
  default     = "Standard_D4s_v3"
}

variable "user_node_min_count" {
  description = "Minimum nodes in user pool"
  default     = 1
}

variable "user_node_max_count" {
  description = "Maximum nodes in user pool"
  default     = 5
}

# ── Networking ────────────────────────────────────────────────────────────────
variable "vnet_address_space" {
  description = "VNet address space"
  default     = "10.0.0.0/16"
}

variable "aks_subnet_cidr" {
  description = "Subnet for AKS nodes and pods (Azure CNI assigns pod IPs from here)"
  default     = "10.0.0.0/17"
}

variable "service_cidr" {
  description = "Kubernetes service CIDR — must NOT overlap with the VNet"
  default     = "10.1.0.0/16"
}

variable "dns_service_ip" {
  description = "DNS service IP within service_cidr"
  default     = "10.1.0.10"
}

# ── ACR ───────────────────────────────────────────────────────────────────────
variable "acr_sku" {
  description = "ACR SKU: Basic | Standard | Premium"
  default     = "Standard"
}
