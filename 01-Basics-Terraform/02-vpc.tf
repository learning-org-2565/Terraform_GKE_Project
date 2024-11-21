# we are going to create VPC for our project
# Resource VPC

resource "google_compute_network" "my-vpc-label" {
    name = "vpcname-myvpc"
    auto_create_subnetworks = false 
}

# Resource: Subnets
resource "google_compute_subnetwork" "Subnet-label" {
    name = "subnet-name"
    region = var.gcp_region1
    ip_cidr_range = "10.128.0.0/20"
    network = google_compute_network.my-vpc-label.id 
  
}