resource "aws_s3_bucket" "project_bucket" {
  #checkov:skip=CKV2_AWS_62:S3 event notifications not required for current project
  #checkov:skip=CKV_AWS_18:S3 access logging not required for current project
  #checkov:skip=CKV_AWS_144:Cross-region replication not required for current project
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "project_bucket" {
  bucket = aws_s3_bucket.project_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "project_bucket" {
  bucket = aws_s3_bucket.project_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_versioning" "project_bucket" {
  bucket = aws_s3_bucket.project_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "project_bucket" {
  bucket = aws_s3_bucket.project_bucket.id

  rule {
    id     = "cleanup-noncurrent-versions"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}

