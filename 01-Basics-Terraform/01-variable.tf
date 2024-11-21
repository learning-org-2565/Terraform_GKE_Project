#we are going to create new variables for our project
variable "gcp_project" {
  description = "we need to provide the project ID"
  type = string
  default = "turnkey-guild-441104-f3"
}

variable "gcp_region1" {
    description = "we need to specify , where we need to deploy our app"        
    type = string
    default = "us-central1"    
}

variable "gcp_machine_type" {
  description = "what kind of machine we are using for our VM"
  type = string
  default = "e2-micro"
}

variable "gcp_zone" {
    description = "specify the zone inside  the region"
    type = string
    default = "us-central1-c"
  
}
variable "boot_disk_image_name" {
  description = "we need to specify the image name "
  type = string
  default = "debian-cloud/debian-12"

}