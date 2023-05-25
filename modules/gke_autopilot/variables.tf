
variable "gke_master_ipv4_cidr_block" {}
variable "project_id" {}
variable "gke_autopilot_cluster_name" {}
variable "region" {}
variable "enviroment" {}
variable "google_compute_network_name" {}
variable "google_compute_subnetwork_name" {}
variable "google_compute_subnetwork_ip_cidr_range" {}
variable "google_compute_subnetwork_secondary_ip_range_name_0" {}
variable "google_compute_subnetwork_secondary_ip_cidr_range_0" {}
variable "google_compute_subnetwork_secondary_ip_range_name_1" {}
variable "google_compute_subnetwork_secondary_ip_cidr_range_1" {}

variable "google_compute_network_vpc_selflink" {}
variable "google_compute_subnetwork_pods_subnet_self_link" {}

variable "cluster_secondary_range_name" {}
variable "services_secondary_range_name" {}