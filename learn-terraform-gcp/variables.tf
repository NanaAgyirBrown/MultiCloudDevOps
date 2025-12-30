variable "project_id" {
  description = "GCP project id"
  default     = "learn-tf-gcp-482306"
}

variable "region" {
  description = "Region for resources"
  default     = "us-central1"
}

variable "zone" {
  description = "Zone for resources"
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "Machine type for the VM instance"
  default     = "f1-micro"
}

variable "access_token" {
  description = "Access token for GCP authentication"
  default     = ""
}