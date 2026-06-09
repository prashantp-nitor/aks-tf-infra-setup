locals {
  tags = {
    environment = var.environment
    project     = "gitops-microservices"
    managed_by  = "terraform"
  }

  acr_name = lower("${replace(var.prefix, "-", "")}acr")
}
