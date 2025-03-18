locals {
  tags = merge(var.tags, {
    "kubespot_env" = var.environment_name
  })
}