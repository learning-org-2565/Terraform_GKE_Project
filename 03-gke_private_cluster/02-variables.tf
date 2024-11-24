# variable
# If we wanna reuse the values in the for the muiltple resources , we can create varibales and reuse
variable "gcp_project" {
    description = "setup the gcp project"
    default = "turnkey-guild-441104-f3"
    type = string
}

variable "gcp_region" {
  description = "whatever application you deploy all the data located in this region"
  type = string
  default = "us-east1"
}

#machine type for the vm instance
variable "gcp_machine_type" {
  description = "setup the machine type for the vm instances which you are going to use in the nodes"
  default = "e2-small"
  type = string
}

#Environment 
variable "environment" {
  description = "Enter the env name , in which emv you are going to deploy the app and cluster"
  type = string
  default = "dev"
}

#business division  
variable "business_divsion" {
    description = "name of the business, for what business you are creating this infra"
    default = "tm_project"
    type = string
  
}

# CIDR Ranges
variable "subnets_ip_ranges" {
  description = "enter the  subnet ranges where we need to deploy our application "
  type = string
  default = "10.129.0.0/20"
}

# pods IP ranges

variable "pod_ip_ranges" {
  default = "10.11.0.0/21"
  type = string
  description = "whatever we mentioned here ranges , pods are going to use those IPs only"
}

# Service IP ranges
variable "service_ip_ranges" {
  description = "all services using in this IPs only"
  type = string
  default = "10.12.0.0/21"
}

#master IP ranges

variable "master_node_ip_ranges" {
  description = " master node or control plane is going to use this IPs"
  default = "10.13.0.0./28"
  type = string
}

