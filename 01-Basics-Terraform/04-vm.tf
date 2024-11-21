# # Resource Virtual machine
# resource "google_compute_instance" "myvm-label" {
#     name = "my-vm-name"
#     machine_type = var.gcp_machine_type
#     zone = var.gcp_zone
#     boot_disk {
#       initialize_params {
#         image = var.boot_disk_image_name
#       }
#     }
#     network_interface {
#         subnetwork = google_compute_subnetwork.Subnet-label.id
#       access_config {
        
#       }
#     }

  
# }