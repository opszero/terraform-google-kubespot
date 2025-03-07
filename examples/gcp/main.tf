provider "google" {
  alias       = "example"
  region      = "us-west1"
  project     = "xx-xxxx-xxxx-xx"
  credentials = file("./account.json")
}

module "gke" {
  source             = "../../"
  project            = "xx-xxxx-xxxx-xx"
  name               = "test"
  machine_type       = "e2-medium"
  image_type         = "UBUNTU_CONTAINERD"
  location           = "us-central1-a"
  min_master_version = "1.29.14-gke.1018000"
  initial_node_count = 1
  min_node_count     = 1
  max_node_count     = 1
  disk_size_gb       = 20
  kms_enabled        = true
}