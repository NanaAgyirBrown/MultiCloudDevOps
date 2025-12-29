terraform {
  cloud {
    organization = "ThinkaiDevOps"
    workspaces {
      name = "learn-terraform-gcp"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }

  required_version = ">= 1.1.0"
}