output "google_compute_network_vpc_self_link" {
    value = google_compute_network.vpc.self_link
}
output "google_compute_subnetwork_pods_subnet_self_link" {
    value = google_compute_subnetwork.pods_subnet.self_link
}
output "google_compute_subnetwork_values_cluster_secondary_name" {
    value = google_compute_subnetwork.pods_subnet.secondary_ip_range[0].range_name
}
output "google_compute_subnetwork_values_service_secondary_name" {
    value = google_compute_subnetwork.pods_subnet.secondary_ip_range[1].range_name
}