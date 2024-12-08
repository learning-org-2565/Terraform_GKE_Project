provider "google" {
  project = var.project_id       # GCP project ID
  region  = var.region           # Region for the GKE cluster
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

# Create the VPC for the GKE cluster
resource "google_compute_network" "gke_vpc" {
  name = var.vpc_name            # Name of the VPC
  auto_create_subnetworks = false # Disable auto subnet creation for more control
}

# Create the subnet for GKE
resource "google_compute_subnetwork" "gke_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.gke_vpc.id

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = var.pod_cidr
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = var.service_cidr
  }
}

# Create the GKE cluster
resource "google_container_cluster" "primary_gke_cluster" {
  name     = var.cluster_name
  location = var.region
  node_locations = ["us-central1-b","us-central1-c"]
  network  = google_compute_network.gke_vpc.self_link
  subnetwork = google_compute_subnetwork.gke_subnet.self_link
  node_config {
    service_account = "githubactions-sa@turnkey-guild-441104-f3.iam.gserviceaccount.com"

  }

  # Master node configuration
  remove_default_node_pool = true
  initial_node_count       = 1

  # Kubernetes networking configuration
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  # Public cluster configurations
  master_authorized_networks_config {
    cidr_blocks {
        cidr_block   = var.authorized_cidr_block # Authorize your network to connect to the cluster
        display_name = "Admin Network"
      }
    
  }

  # Basic configurations
  release_channel {
    channel = "STABLE" # Stable release channel for production readiness
  }

  # GKE cluster security
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  # Enable useful features
  enable_intranode_visibility = true
  enable_shielded_nodes       = true
  #network_policy              = true # Enforce Kubernetes NetworkPolicy

  # Set Kubernetes dashboard access to disabled (recommended)
  addons_config {
    http_load_balancing {
      disabled = false
    }
    network_policy_config {
      disabled = false
    }
  }
}

# Add a node pool to the cluster
resource "google_container_node_pool" "gke_node_pool" {
  cluster    = google_container_cluster.primary_gke_cluster.name
  location   = var.region
  node_count = var.node_count

  # Node configurations
  node_config {
    preemptible  = var.preemptible_nodes # Use preemptible VMs for cost savings
    machine_type = var.node_machine_type
    disk_size_gb = var.node_disk_size

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform", # Full GCP API access
    ]

    metadata = {
      disable-legacy-endpoints = "true" # Disable legacy metadata for security
    }

    service_account = var.gke_service_account
    tags            = ["gke-node"]
  }

  # Autoscaling settings
  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
}

# Firewall rule for GKE master communication
resource "google_compute_firewall" "gke_master_to_nodes" {
  name    = "allow-master-to-nodes"
  network = google_compute_network.gke_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["443", "10250"]
  }

  source_ranges = [var.master_cidr_block] # Only allow the master's CIDR
  target_tags   = ["gke-node"]
}

# Firewall rule for public access to the cluster
resource "google_compute_firewall" "gke_public_access" {
  name    = "allow-public-access"
  network = google_compute_network.gke_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = [var.authorized_cidr_block] # Limit to trusted public CIDR blocks
  target_tags   = ["gke-node"]
}
