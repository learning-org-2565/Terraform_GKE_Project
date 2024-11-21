# # Firwall Rule: SSH
# resource "google_compute_firewall" "myfirewall_ssh_label" {
#     name = "ssh-namefirewall"
#     allow {
#       ports = ["22"]
#       protocol = "tcp"

#     }
#     direction = "INGRESS"
#     network = google_compute_network.my-vpc-label.id 
#     priority = 1000
#     source_ranges = [ "0.0.0.0/0" ]
#     target_tags = [ "ssh-tags" ]
#  }

#  # Firewall rule: HTTP port 80

# resource "google_compute_firewall" "firewall_http_label" {
#     name = "firewall-http-name"
#     allow {
#       ports = [ "80" ]
#       protocol = "tcp"
#     }
#     direction = "INGRESS"
#     network = google_compute_network.my-vpc-label.id 
#     priority = 1000
#     source_ranges = [ "0.0.0.0/0" ]
#     target_tags = [ "http-tags" ]
  
# }