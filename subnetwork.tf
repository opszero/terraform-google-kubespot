resource "google_compute_subnetwork" "subnet" {
  name    = var.environment_name
  region  = var.region
  project = var.project

  network = google_compute_network.network.self_link

  # TODO: Convert to variable
  ip_cidr_range = "10.2.0.0/16"

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }

  depends_on = [google_compute_network.network]
}

resource "google_compute_network" "network" {
  name                    = var.environment_name
  project                 = var.project
  auto_create_subnetworks = false
}

resource "google_compute_global_address" "private_ip_address" {
  name          = var.environment_name
  project       = var.project
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.network.self_link
}

resource "null_resource" "sql_vpc_lock" {
  depends_on = [google_service_networking_connection.private_vpc_connection]
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.network.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

resource "google_compute_router" "nat_router" {
  name    = var.environment_name
  region  = var.region
  network = google_compute_network.network.self_link
  project = var.project
}

resource "google_compute_router_nat" "nat_config" {
  name                               = var.environment_name
  router                             = google_compute_router.nat_router.name
  region                             = var.region
  project                            = var.project
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}