variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "acr_name" {
  description = "ACR name — globally unique, alphanumeric only"
  type        = string
}

variable "acr_sku" {
  description = "ACR SKU: Basic | Standard | Premium"
  type        = string
  default     = "Standard"
}

variable "kubelet_identity_object_id" {
  description = "Object ID of the AKS kubelet identity for AcrPull role assignment"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
