# terraform settings to get access to GCP Cloud
terraform {
  required_version = ">= 1.9"
  required_providers {
    google = {
        source = "hashicorp/google"
        version = ">= 5.42.0"
    }
  }
  backend "gcs" {
    name = "terraform-statefile-bucket-tf"
    prefix = "gke_private/remote_state"
  }
}

# provider 
provider "google" {
  project = var.gcp_project
  region = var.gcp_region
}

