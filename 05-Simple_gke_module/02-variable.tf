variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region for the cluster"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "gke-vpc"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "pod_cidr" {
  description = "CIDR block for Pods"
  type        = string
}

variable "service_cidr" {
  description = "CIDR block for Services"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "node_machine_type" {
  description = "Machine type for the nodes"
  type        = string
  default     = "e2-standard"
}

variable "node_disk_size" {
  description = "Disk size for each node"
  type        = number
  default     = 05
}

variable "node_count" {
  description = "Number of nodes in the node pool"
  type        = number
  default     = 2
}

variable "min_node_count" {
  description = "Minimum number of nodes for autoscaling"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes for autoscaling"
  type        = number
  default     = 5
}

variable "preemptible_nodes" {
  description = "Whether to use preemptible VMs"
  type        = bool
  default     = false
}

variable "gke_service_account" {
  description = "Service account for GKE nodes"
  type        = string
}

variable "master_cidr_block" {
  description = "CIDR block for the master nodes"
  type        = string
}

variable "authorized_cidr_block" {
  description = "Authorized CIDR block for public access"
  type        = string
}
