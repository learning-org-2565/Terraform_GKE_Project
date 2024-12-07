# region = "us-central1"
# network = "gke-module"
# subnetwork = "gke-subnetwork"

project_id = "turnkey-guild-441104-f3"
cluster_name_suffix = "-dev"
region = "us-central1"
network = "myvpc"
subnetwork = "mysubnet"
ip_range_pods = "10.11.0.0/21"
ip_range_services = "10.12.0.0/21"
compute_engine_service_account = "githubactions-sa@turnkey-guild-441104-f3.iam.gserviceaccount.com"
enable_binary_authorization = false
