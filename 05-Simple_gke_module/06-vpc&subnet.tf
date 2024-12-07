# Resource: VPC
resource "google_compute_network" "myvpc" {
  name = "gke-module-vpc"
  auto_create_subnetworks = false   
}

# Resource: Subnet
resource "google_compute_subnetwork" "mysubnet" {
  name = "gke-module-subnet"
  region = "us-central1"
  ip_cidr_range = "10.128.0.0/20"
  network = google_compute_network.myvpc.id 
  private_ip_google_access = true
}