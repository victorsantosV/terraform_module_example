output "cluster_name" {
  value = google_container_cluster.private.monitoring_service
}
output "region_name" {
  value = google_container_cluster.private.private_cluster_config[0].enable_private_endpoint
}