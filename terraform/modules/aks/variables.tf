variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "prefix" {
  type = string
}

variable "environment" {
  type = string
}

variable "kubernetes_version" {
  description = "Kubernetes version — null uses latest stable"
  type        = string
  default     = null
}

variable "aks_sku_tier" {
  description = "AKS SLA tier: Free or Paid"
  type        = string
  default     = "Free"
}

variable "aks_subnet_id" {
  description = "Subnet ID for AKS nodes (Azure CNI)"
  type        = string
}

variable "service_cidr" {
  type = string
}

variable "dns_service_ip" {
  type = string
}

variable "system_node_vm_size" {
  type = string
}

variable "system_node_count" {
  type = number
}

variable "system_node_min_count" {
  type = number
}

variable "system_node_max_count" {
  type = number
}

variable "tags" {
  type    = map(string)
  default = {}
}
