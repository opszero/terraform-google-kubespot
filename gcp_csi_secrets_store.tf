resource "helm_release" "csi_secrets_store" {
  count = var.csi_secrets_store_enabled ? 1 : 0

  name       = "csi-secrets-store"
  repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart      = "secrets-store-csi-driver"

  namespace        = "csi"
  create_namespace = true
}

data "http" "csi_secrets_store_gcp_provider" {
  url = "https://raw.githubusercontent.com/GoogleCloudPlatform/secrets-store-csi-driver-provider-gcp/main/deploy/provider-gcp-plugin.yaml"
}

resource "null_resource" "csi_secrets_store_aws_provider" {
  count = var.csi_secrets_store_enabled ? 1 : 0

  triggers = {
    name       = helm_release.csi_secrets_store[count.index].name
    namespace  = helm_release.csi_secrets_store[count.index].namespace
    repository = helm_release.csi_secrets_store[count.index].repository
  }

  depends_on = [helm_release.csi_secrets_store]

  provisioner "local-exec" {
    command = "kubectl apply -f -<<EOF\n${data.http.csi_secrets_store_gcp_provider.response_body}\nEOF"

  }
}