resource "google_compute_network" "vpc" {
  project                 = var.project_id
  name                    = var.google_compute_network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "pods_subnet" {
  project                 = var.project_id
  name          = var.google_compute_subnetwork_name
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.google_compute_subnetwork_ip_cidr_range

  secondary_ip_range {
    range_name    = var.google_compute_subnetwork_secondary_ip_range_name_0
    ip_cidr_range = var.google_compute_subnetwork_secondary_ip_cidr_range_0
  }

  secondary_ip_range {
    range_name    = var.google_compute_subnetwork_secondary_ip_range_name_1
    ip_cidr_range = var.google_compute_subnetwork_secondary_ip_cidr_range_1
  }
}
