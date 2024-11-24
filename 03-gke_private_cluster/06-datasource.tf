data "google_compute_zones" "available" {
  status = "UP"
}


output "compute_zones" {
    value = data.google_compute_zones.available.names
    description = "list of compute zone"
  
}