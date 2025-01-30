provider "aws" {
  region = var.region
}


resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(
    var.tags,
    {
      Name = var.bucket_name
    }
  )
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_versioning" "this_versioning" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.versioning_enabled
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.kms_master_key_id
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id     = var.lifecycle_rule_id
    status = var.lifecycle_rule_enabled ? "Enabled" : "Disabled"

    transition {
      days          = var.lifecycle_transition_days
      storage_class = var.lifecycle_transition_storage_class
    }

    expiration {
      days = var.lifecycle_expiration_days
    }
  }
}