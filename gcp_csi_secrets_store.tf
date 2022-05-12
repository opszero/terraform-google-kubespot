resource "helm_release" "csi_secrets_store" {
  count = var.csi_secrets_store_enabled ? 1 : 0

  name       = "csi-secrets-store"
  repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart      = "secrets-store-csi-driver"

  namespace        = "kube-system"
  create_namespace = false
}

data "kubectl_file_documents" "gcp_csi" {
  content = file("gcp-provider-plugin.yaml")
}

resource "kubectl_manifest" "gcp_csi" {
  for_each  = data.kubectl_file_documents.gcp_csi.manifests
  yaml_body = each.value
}
