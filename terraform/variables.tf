variable "instance_name" {
  type = string
}

variable "project_id" {
  description = "The name of the new GCP project"
}

variable "machine_type" {
  description = "specified image id for instance"
  default = "n1-standard-1"
}

variable "region" {
  description = "gcp region for specified instance"
  default = "us-west1-b"
}

variable "project" {
  description = "project name in which we will create all instance"
  default = "cf-and-ansible-workshops"
}

variable "image_name" {
  description = "image type for given instance"
  default = "ubuntu-1604-xenial-v20190411"
}

variable "image_family" {
  description = "image family for given instance"
  default = "ubuntu-os-cloud"
}

variable "network" {
  description = "network for given instance"
  default = "default"
}

variable "credential" {
  description = "credential file path different for different users"
  default = "/var/lib/awx/.config/gcloud/application_default_credentials.json"
}

variable "tags" {
  type = list
  description = "tags is used for defining the rule of a instance"
}
