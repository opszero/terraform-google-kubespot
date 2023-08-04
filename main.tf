data "google_client_config" "current" {}

resource "google_container_cluster" "cluster" {
  name     = var.environment_name
  location = var.region
  project  = var.project

  network    = google_compute_network.network.self_link
  subnetwork = google_compute_subnetwork.subnet.self_link


  min_master_version = var.cluster_version

  enable_autopilot = true

  node_pool_auto_config {
    network_tags {
      tags = local.tags
    }
  }

  ip_allocation_policy {}

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }
}
