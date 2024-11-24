# we are going to create vpc and subnet resource code here
resource "google_compute_network" "private_gke_vpc" {
    description = "we are going to create vpc for the gke cluster(private)"
    name = "${local.name}-vpc"
    auto_create_subnetworks = false 
  
}



# subnets
resource "google_compute_subnetwork" "private_gke_subnets" {
    description = "we are going to create subnets for our cluster"
    name = "${local.name}-${var.gcp_region}-subnets"
    region = var.gcp_region
    network = google_compute_network.private_gke_vpc.id
    private_ip_google_access = true 
    ip_cidr_range = "10.129.0.0/20"
    secondary_ip_range {
        range_name = "k8s POD ranges"
        ip_cidr_range = var.pod_ip_ranges
    }

    secondary_ip_range {
        range_name = "SERVICE IPs range"
        ip_cidr_range = var.service_ip_ranges
    }
}