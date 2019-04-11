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
