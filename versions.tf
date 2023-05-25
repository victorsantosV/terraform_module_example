terraform {
  required_version = ">= 0.13"
  backend "gcs" {
    bucket = "fnt-tf-state"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~>4.50.0"
    }

  }
}