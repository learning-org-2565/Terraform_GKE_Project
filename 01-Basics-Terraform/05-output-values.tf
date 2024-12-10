# outputs 

#Attribites

output "instance-id" {
  description = "to see the instance id in the command line "
  value = google_compute_instance.myvm-label.instance_id
}

output "vm-external-ip" {
  description = "to get public ip in the CMD"
  value = google_compute_instance.myvm-label.network_interface.0.access_config.0.nat_ip

}

output "resource-self-link-url" {
  description = "After created resource we can get resource address location by url"
  value = google_compute_instance.myvm-label.self_link
}