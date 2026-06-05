variable "name" {
  description = "Node pool name (alphanumeric, max 12 chars)"
  type        = string
}

variable "kubernetes_cluster_id" {
  description = "Resource ID of the parent AKS cluster"
  type        = string
}

variable "vm_size" {
  description = "VM size for pool nodes"
  type        = string
}

variable "min_count" {
  description = "Minimum node count for autoscaler"
  type        = number
}

variable "max_count" {
  description = "Maximum node count for autoscaler"
  type        = number
}

variable "subnet_id" {
  description = "Subnet ID for node pool (Azure CNI)"
  type        = string
}

variable "environment" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
