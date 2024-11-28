# Resource: GKE Node Pool 1
resource "google_container_node_pool" "nodepool_1" {
  name       = "${local.name}-node-pool-1"
  location   = var.gcp_region1
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 2
  node_config {
    preemptible  = true
    machine_type = var.machine_type
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = "githubactions-sa@turnkey-guild-441104-f3.iam.gserviceaccount.com"
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    tags = [tolist(google_compute_firewall.fw_ssh.target_tags)[0]]
  }
}