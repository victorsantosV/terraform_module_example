provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "my-context"
}

resource "google_container_cluster" "private" {
  project                  = var.project_id
  name                     = var.gke_autopilot_cluster_name
  location                 = var.region

  network = var.google_compute_network_vpc_selflink
  subnetwork = var.google_compute_subnetwork_pods_subnet_self_link


  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.gke_master_ipv4_cidr_block
  }

  # Enable Autopilot for this cluster
  enable_autopilot = true

  # Configuration of cluster IP allocation for VPC-native clusters
  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster_secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name
  }

  # Configuration options for the Release channel feature, which provide more control over automatic upgrades of your GKE clusters.
  release_channel {
    channel = "REGULAR"
  }
}


