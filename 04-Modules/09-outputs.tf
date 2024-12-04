# we are going to see outputs of the resources created without going to console ans see,
# the advantages of this output is , if you wanna use created resource id or name you don;t need to wait untill it creates
#  you can specify the output of the resources whereever you wanna use it , then automatically it will retrive once resource created

# output "gke_cluster_name" {
#   description = "gke name"
#   value = google_container_cluster.private_gke_cluster.name
# }

# output "gke_loation" {
#   value = google_container_cluster.private_gke_cluster.location
# }

# output "gke_endpoints" {
#   value = google_container_cluster.private_gke_cluster.endpoint
# }

output "vpc_id" {
  description = "vpc_id"
  value = module.vpc_demo_module.network_id
}

output "subnet_id" {
  description = "subnet ids"
  value = module.vpc_demo_module.subnets_ids[0]
}