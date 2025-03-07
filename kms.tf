resource "google_kms_key_ring" "keyring" {
  count   = var.kms_enabled ? 1 : 0
  name    = var.name
  project = var.project

  location = "global"

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_kms_crypto_key" "key" {
  count = var.kms_enabled ? 1 : 0
  name  = var.name

  key_ring = join("", google_kms_key_ring.keyring.*.id)

  lifecycle {
    prevent_destroy = false
  }
}
