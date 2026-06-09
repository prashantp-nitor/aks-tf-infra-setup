variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "acr_name" {
  description = "ACR name — globally unique, alphanumeric only, 5-50 chars"
  type        = string
}

variable "acr_sku" {
  description = "ACR SKU: Basic | Standard | Premium"
  type        = string
  default     = "Standard"
}

variable "tags" {
  type    = map(string)
  default = {}
}
