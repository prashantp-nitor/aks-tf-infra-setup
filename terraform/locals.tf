locals {
  tags = {
    environment = var.environment
    project     = "gitops-microservices"
    managed_by  = "terraform"
  }
}
