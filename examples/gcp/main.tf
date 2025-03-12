provider "google" {
  region  = "us-central1"
  project = "xx-xx-xx-xx"
}

module "gke" {
  source                    = "../../"
  project                   = "xx-xx-xx-xx"
  environment_name          = "example"
  machine_type              = "e2-medium"
  image_type                = "UBUNTU_CONTAINERD"
  location                  = "us-central1-a"
  min_master_version        = "1.30.9-gke.1046000"
  sql_master_username       = "root"
  sql_master_password       = "pass"
  initial_node_count        = 1
  min_node_count            = 1
  max_node_count            = 1
  disk_size_gb              = 20
  csi_secrets_store_enabled = true
  kms_enabled               = true
  sql_enabled               = true
  redis_enabled             = true
}