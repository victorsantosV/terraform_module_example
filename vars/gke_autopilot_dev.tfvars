project_id = "PROJETO ID GCP"
enviroment = "autopilot"
region = "us-east1"
gke_master_ipv4_cidr_block = "172.23.0.0/28"
## Network Module
google_compute_network_name = "my-vpc"
google_compute_subnetwork_name = "pods-subnet"
google_compute_subnetwork_ip_cidr_range = "10.0.0.0/24"
google_compute_subnetwork_secondary_ip_range_name_0 = "pods"
google_compute_subnetwork_secondary_ip_cidr_range_0 = "10.1.0.0/16"
google_compute_subnetwork_secondary_ip_range_name_1 = "services"
google_compute_subnetwork_secondary_ip_cidr_range_1 = "10.4.0.0/16"
## gke_K8S_Module
gke_autopilot_cluster_name = "fnt-autopilot-tf-test"
