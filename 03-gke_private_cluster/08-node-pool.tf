# now lets create node pools for the private gke cluster
# node pools means grp of the nodes

resource "google_container_node_pool" "private_gke_nodepool" {
  name = "${local.name}-nodepool"
  location = "us-central1"
  cluster = google_container_cluster.private_gke_cluster.name 
  initial_node_count = 1
  autoscaling {
    min_node_count = 1
    max_node_count = 3
    location_policy = "ANY"
  }
  node_config {
    preemptible = true
    machine_type = var.gcp_machine_type
    service_account = "githubactions-sa@turnkey-guild-441104-f3.iam.gserviceaccount.com"
    oauth_scopes = [ 
        "https://www.googleapis.com/auth/cloud-platform"
    
    ]
    tags = [tolist(google_compute_firewall.fw_ssh.target_tags)[0]]
    disk_size_gb = 20
    disk_type = "pd-standard"

  }
}