locals {
  tags = merge(var.tags, {
    "kubespot_env" = var.name
  })
}