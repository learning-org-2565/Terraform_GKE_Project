resource "google_container_cluster" "private_gke_cluster" {
    name = "${local.name}-private-cluster"
    location = var.gcp_region
    node_locations = data.google_compute_zones.available.names
    node_config {
    service_account = "githubactions-sa@turnkey-guild-441104-f3.iam.gserviceaccount.com"

  }

    # we are creating one default node pool but immidiately we will remove it . default is not recommanded
    remove_default_node_pool = true 
    initial_node_count = 1

    # network
    network = google_compute_network.private_gke_vpc.self_link
    subnetwork = google_compute_subnetwork.private_gke_subnets

    deletion_protection = false 



    # private cluster config
    private_cluster_config {
      enable_private_endpoint = false
      enable_private_nodes = true  # nodes are connecting to the control plane through private connectivity
      master_ipv4_cidr_block = var.master_node_ip_ranges
    }

    # IP addredd allocations
    ip_allocation_policy {
      cluster_secondary_range_name = google_compute_subnetwork.private_gke_subnets.secondary_ip_range[0].range_name # Mis: network mentioned 
      services_secondary_range_name = google_compute_subnetwork.private_gke_subnets.secondary_ip_range[1].range_name
    }

    master_authorized_networks_config {
      cidr_blocks {
        cidr_block = "152.59.192.182/32"
        display_name = "from local to cluster"
      }
    }


  
}