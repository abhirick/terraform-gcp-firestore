provider "google-beta" {
  project = var.project_id
  region  = var.region
}

# Enable Firestore API
# resource "google_project_service" "firestore" {
#   service = "firestore.googleapis.com"
#   project = var.project_id
# }

# Enable Cloud KMS API
#resource "google_project_service" "cloudkms" {
#  service = "cloudkms.googleapis.com"
#  project = var.project_id
#}

# Data resource to get project details
data "google_project" "project" {
  provider = google-beta
}

# Create KMS Key Ring
resource "google_kms_key_ring" "key_ring" {
  provider = google-beta

  name     = var.key_ring_name
  location = var.region
}

# Create KMS Crypto Key
resource "google_kms_crypto_key" "crypto_key" {
  provider = google-beta

  name     = var.crypto_key_name
  key_ring = google_kms_key_ring.key_ring.id
  purpose  = "ENCRYPT_DECRYPT"
}

# IAM Binding for Firestore CMEK
resource "google_kms_crypto_key_iam_binding" "firestore_cmek_keyuser" {
  provider = google-beta

  crypto_key_id = google_kms_crypto_key.crypto_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:service-${data.google_project.project.number}@gcp-sa-firestore.iam.gserviceaccount.com",
  ]
}

# Create Firestore Database with CMEK
resource "google_firestore_database" "database" {
  provider = google-beta

  project                           = var.project_id
  name                              = var.database_name
  location_id                       = var.region
  type                              = "FIRESTORE_NATIVE"
  concurrency_mode                  = "OPTIMISTIC"
  app_engine_integration_mode       = "DISABLED"
  point_in_time_recovery_enablement = "POINT_IN_TIME_RECOVERY_ENABLED"
# delete_protection_state           = "DELETE_PROTECTION_DISABLED"
  deletion_policy                   = "DELETE"

  # Comment out or remove the cmek_config block to disable CMEK
  # cmek_config {
  #   kms_key_name = google_kms_crypto_key.crypto_key.id
  # }

  depends_on = [
    google_kms_crypto_key_iam_binding.firestore_cmek_keyuser
  ]
}
