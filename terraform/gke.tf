resource "google_container_cluster" "webapp" {
  provider           = "google-beta"
  name               = "website"
  zone               = "us-central1-a"
  initial_node_count = "1"
  enable_legacy_abac = "true"
  min_master_version = "1.12.6-gke.10"
  monitoring_service = "monitoring.googleapis.com"
  network            = "${var.network}"
  subnetwork         = "second"

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  master_authorized_networks_config = {
    cidr_blocks = [
      {
        cidr_block   = "0.0.0.0/0"
        display_name = "any"
      },
    ]
  }

  ip_allocation_policy {
    services_secondary_range_name = "webapp-services"
    cluster_secondary_range_name  = "webapp-pods"
  }

  default_max_pods_per_node = "32"

  depends_on = [
    "google_compute_subnetwork.second",
  ]
}
