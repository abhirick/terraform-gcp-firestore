output "firestore_database_name" {
  description = "The name of the Firestore database."
  value       = google_firestore_database.database.name
}

output "firestore_database_id" {
  description = "The ID of the Firestore database."
  value       = google_firestore_database.database.id
}

output "kms_key_ring_name" {
  description = "The name of the KMS key ring."
  value       = google_kms_key_ring.key_ring.name
}

output "kms_crypto_key_name" {
  description = "The name of the KMS crypto key."
  value       = google_kms_crypto_key.crypto_key.name
}

output "kms_crypto_key_id" {
  description = "The ID of the KMS crypto key."
  value       = google_kms_crypto_key.crypto_key.id
}

output "project_id" {
  description = "The ID of the Google Cloud project."
  value       = var.project_id
}
