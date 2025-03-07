resource "google_container_cluster" "primary" {
  name                     = var.name
  project                  = var.project
  network                  = google_compute_network.network.id
  subnetwork               = google_compute_subnetwork.subnet.id
  remove_default_node_pool = var.remove_default_node_pool
  location                 = var.location
  initial_node_count       = var.initial_node_count
  min_master_version       = var.min_master_version

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
  }

  node_config {
    preemptible  = true
    machine_type = var.machine_type
  }

  lifecycle {
    ignore_changes = [initial_node_count]
  }
  deletion_protection = false
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

resource "google_container_node_pool" "node_pool" {
  name               = "${var.name}-node-pool"
  project            = var.project
  location           = var.location
  cluster            = google_container_cluster.primary.id
  initial_node_count = var.initial_node_count

  autoscaling {
    min_node_count  = var.min_node_count
    max_node_count  = var.max_node_count
    location_policy = var.location_policy
  }

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }

  node_config {
    image_type      = var.image_type
    machine_type    = var.machine_type
    service_account = var.service_account
    disk_size_gb    = var.disk_size_gb
    disk_type       = var.disk_type
    preemptible     = var.preemptible
  }

  lifecycle {
    ignore_changes        = [initial_node_count]
    create_before_destroy = false
  }

  timeouts {
    create = var.cluster_create_timeouts
    update = var.cluster_update_timeouts
    delete = var.cluster_delete_timeouts
  }
}

resource "null_resource" "configure_kubectl" {
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.name} --zone ${var.location} --project ${var.project}"
    environment = {
      KUBECONFIG = var.kubectl_config_path != "" ? var.kubectl_config_path : ""
    }
  }
  depends_on = [google_container_node_pool.node_pool]
}