resource "google_kms_key_ring" "apps" {
  name     = "apps"
  location = "${var.region}"
}

resource "google_kms_crypto_key" "helm" {
  name     = "helm"
  key_ring = "${google_kms_key_ring.apps.self_link}"

  # KMS Key Rings can not be deleted once created. This is to save us from
  # getting into a weird state and losing keys.
  lifecycle {
    prevent_destroy = true
  }
}
