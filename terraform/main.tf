provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = "${file(var.credential)}"
}

locals {
  api_services = [
    "cloudbilling.googleapis.com",
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "oslogin.googleapis.com",
    "serviceusage.googleapis.com"
  ]
}

data "google_project" "main" {
  project_id = var.project_id
}

data "google_compute_image" "image" {
  name    = "${var.image_name}"
  project = "${var.image_family}"
}

resource "google_compute_instance" "default" {
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  tags         = "${var.tags}"
  zone         = "${var.region}"
  allow_stopping_for_update = true

  labels = {
    environment = "dev"
  }

  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.image.self_link}"
    }
  }

  network_interface {
    network = "${var.network}"

    access_config {
      # nat_ip = "${google_compute_address.static.address}"
    }
  }
}

output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}
