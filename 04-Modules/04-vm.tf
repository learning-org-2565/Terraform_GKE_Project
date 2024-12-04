# Resource Virtual machine
resource "google_compute_instance" "myvm-label" {
    name = "my-vm-name"
    machine_type = var.gcp_machine_type
    zone = "asia-southeast1-a"
    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-12"
      }
    }
    network_interface {
        subnetwork = module.vpc_demo_module.subnets_ids[0]
      access_config {
        
      }
    }

  
}