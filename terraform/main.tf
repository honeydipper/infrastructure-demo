provider "google" {
  project = "${var.project}"
}

provider "google-beta" {
  project = "${var.project}"
}

"terraform" {
  backend "gcs" {
    bucket = "honeydipper-demo"
    prefix = "terraform-state/the-pulsar-236622"
  }
}

resource "google_compute_subnetwork" "default-us-central1" {
  name          = "default"
  ip_cidr_range = "10.128.0.0/20"
  region        = "us-central1"
  network       = "${var.network}"
  secondary_ip_range {
    range_name    = "gke-matrix-pods-1bc9173f"
    ip_cidr_range = "10.52.0.0/14"
  }
  secondary_ip_range {
    range_name    = "gke-matrix-services-1bc9173f"
    ip_cidr_range = "10.180.0.0/20"
  }
  secondary_ip_range {
    range_name    = "gke-webapp-services"
    ip_cidr_range = "10.180.16.0/20"
  }
}
