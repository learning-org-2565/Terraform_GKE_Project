output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster"
  value       = google_container_cluster.primary_gke_cluster.endpoint
}

output "cluster_ca_certificate" {
  description = "The CA certificate of the GKE cluster"
  value       = google_container_cluster.primary_gke_cluster.master_auth[0].cluster_ca_certificate
}

output "node_pool_instance_group_urls" {
  description = "Instance group URLs for the node pool"
  value       = google_container_node_pool.gke_node_pool.instance_group_urls
}
