variable "project_id" {
  description = "The ID of the project in which to create the Firestore database."
  type        = string
}

variable "region" {
  description = "The region in which to create the Firestore database and KMS key ring."
  type        = string
  default     = "us-central1"
}

variable "key_ring_name" {
  description = "The name of the KMS key ring."
  type        = string
}

variable "crypto_key_name" {
  description = "The name of the KMS crypto key."
  type        = string
}

variable "database_name" {
  description = "The name of the Firestore database."
  type        = string
}
