provider "google" {
  region  = "us-central1"
  project = "xx-xxxx-xxxx-xx"
}

module "gke" {
  source                    = "../../"
  project                   = "xx-xxxx-xxxx-xx"
  name                      = "dev"
  machine_type              = "e2-medium"
  image_type                = "UBUNTU_CONTAINERD"
  location                  = "us-central1-a"
  min_master_version        = "1.29.14-gke.1018000"
  initial_node_count        = 1
  min_node_count            = 1
  max_node_count            = 1
  disk_size_gb              = 20
}