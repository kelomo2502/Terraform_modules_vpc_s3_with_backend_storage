variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "region" {
  description = "The AWS region where the S3 bucket will be created"
  type        = string
  default = "us-east-1"
}

variable "acl" {
  description = "The access control list (ACL) for the bucket"
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "Enable versioning for the bucket"
  type        = string
  default     = "Disabled"
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use (e.g., AES256, aws:kms)"
  type        = string
  default     = "AES256"
}

variable "kms_master_key_id" {
  description = "The KMS master key ID to use for encryption (if SSE algorithm is aws:kms)"
  type        = string
  default     = null
}

variable "lifecycle_rule_id" {
  description = "The ID for the lifecycle rule"
  type        = string
  default     = "default-lifecycle-rule"
}

variable "lifecycle_rule_enabled" {
  description = "Enable or disable the lifecycle rule"
  type        = bool
  default     = false
}

variable "lifecycle_transition_days" {
  description = "The number of days after which to transition objects to another storage class"
  type        = number
  default     = 30
}

variable "lifecycle_transition_storage_class" {
  description = "The storage class to transition objects to (e.g., GLACIER)"
  type        = string
  default     = "GLACIER"
}

variable "lifecycle_expiration_days" {
  description = "The number of days after which to expire objects"
  type        = number
  default     = 365
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}
