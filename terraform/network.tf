resource "google_compute_subnetwork" "second" {
  name                     = "second"
  ip_cidr_range            = "10.128.16.0/22"
  region                   = "us-central1"
  network                  = "${var.network}"
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "webapp-pods"
    ip_cidr_range = "10.99.0.0/22"
  }

  secondary_ip_range {
    range_name    = "webapp-services"
    ip_cidr_range = "10.98.0.0/24"
  }
}
