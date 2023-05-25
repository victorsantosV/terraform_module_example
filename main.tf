module "gke_network_autopilot" {
  source = "./modules/gke_network_autopilot"
  project_id = var.project_id
  google_compute_network_name = var.google_compute_network_name
  google_compute_subnetwork_name = var.google_compute_subnetwork_name
  google_compute_subnetwork_ip_cidr_range = var.google_compute_subnetwork_ip_cidr_range
  google_compute_subnetwork_secondary_ip_range_name_0 = var.google_compute_subnetwork_secondary_ip_range_name_0
  google_compute_subnetwork_secondary_ip_cidr_range_0 = var.google_compute_subnetwork_secondary_ip_cidr_range_0
  google_compute_subnetwork_secondary_ip_range_name_1 = var.google_compute_subnetwork_secondary_ip_range_name_1
  google_compute_subnetwork_secondary_ip_cidr_range_1 = var.google_compute_subnetwork_secondary_ip_cidr_range_1
}

module "gke_autopilot" {
  source = "./modules/gke_autopilot"
  google_compute_network_name = var.google_compute_network_name
  google_compute_subnetwork_name = var.google_compute_subnetwork_name
  google_compute_subnetwork_ip_cidr_range = var.google_compute_subnetwork_ip_cidr_range
  google_compute_subnetwork_secondary_ip_range_name_0 = var.google_compute_subnetwork_secondary_ip_range_name_0
  google_compute_subnetwork_secondary_ip_cidr_range_0 = var.google_compute_subnetwork_secondary_ip_cidr_range_0
  google_compute_subnetwork_secondary_ip_range_name_1 = var.google_compute_subnetwork_secondary_ip_range_name_1
  google_compute_subnetwork_secondary_ip_cidr_range_1 = var.google_compute_subnetwork_secondary_ip_cidr_range_1
  project_id = var.project_id
  enviroment = var.enviroment
  region = var.region
  gke_autopilot_cluster_name = var.gke_autopilot_cluster_name
  gke_master_ipv4_cidr_block =  var.gke_master_ipv4_cidr_block
// network
  google_compute_network_vpc_selflink = module.gke_network_autopilot.google_compute_network_vpc_self_link
  google_compute_subnetwork_pods_subnet_self_link = module.gke_network_autopilot.google_compute_subnetwork_pods_subnet_self_link
  cluster_secondary_range_name = module.gke_network_autopilot.google_compute_subnetwork_values_cluster_secondary_name
  services_secondary_range_name = module.gke_network_autopilot.google_compute_subnetwork_values_service_secondary_name
}

module "k8s_manifest" {
  depends_on = [module.gke_autopilot]
  source = "./modules/k8s_manifest"
  region = var.region
  project_id = var.project_id
  gke_autopilot_cluster_name = var.gke_autopilot_cluster_name
}