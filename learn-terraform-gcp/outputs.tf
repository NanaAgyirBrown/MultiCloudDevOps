output "vpc_network_id" {
  value = google_compute_network.vpc_network.id
}

output "vpc_network_self_link" {
  value = google_compute_network.vpc_network.self_link
}

output "vpc_network_auto_create_subnetworks" {
  value = google_compute_network.vpc_network.auto_create_subnetworks
}

output "vpc_network_name" {
  value = google_compute_network.vpc_network.name
}

output "vm_instance_id" {
  value = google_compute_instance.vm_instance.id
}

output "vm_instance_name" {
  value = google_compute_instance.vm_instance.name
}

output "vm_instance_machine_type" {
  value = google_compute_instance.vm_instance.machine_type
}

output "vm_instance_tags" {
    value = google_compute_instance.vm_instance.tags
}