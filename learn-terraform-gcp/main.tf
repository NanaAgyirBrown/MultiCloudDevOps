provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
  access_token = var. access_token
}

resource "google_compute_network" "vpc_network" {
  name                    = "tf-vpc-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "vm_instance" {
    name = "tf-vm-instance"
    machine_type = var.machine_type

    boot_disk {
      initialize_params {
        image = "cos-cloud/cos-stable"
      }
    }

    network_interface {
      network = google_compute_network.vpc_network.name
      access_config {
        
      }
    }

    tags = [ "web", "dev" ]
}