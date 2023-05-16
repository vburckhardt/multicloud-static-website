# Generate unique name for bucket
resource "random_string" "bucket_name_suffix" {
  length  = 4
  special = false
  upper   = false
}

locals {
  bucket_name = "${var.prefix}-web-bucket-${random_string.bucket_name_suffix.id}"
}


# Create bucket policy giving anonymous public read access
data "aws_iam_policy_document" "anonymous_bucket_policy" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${local.bucket_name}/*",
    ]
  }
}

# Create and configure the bucket
#tfsec:ignore:aws-s3-enable-bucket-encryption tfsec:ignore:aws-s3-encryption-customer-key tfsec:ignore:aws-s3-block-public-policy tfsec:ignore:aws-s3-no-public-buckets tfsec:ignore:aws-s3-enable-versioning tfsec:ignore:aws-s3-enable-bucket-logging
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.10.1"

  bucket = local.bucket_name

  restrict_public_buckets = false
  block_public_policy     = false
  attach_policy           = true
  policy                  = data.aws_iam_policy_document.anonymous_bucket_policy.json

  website = {
    index_document = "index.html"
    error_document = "error.html"
  }
}

# Add files to the bucket
locals {
  static_directory = "${path.module}/../static"
  files            = fileset(local.static_directory, "*")
}

module "object" {
  source  = "terraform-aws-modules/s3-bucket/aws//modules/object"
  version = "3.10.1"

  for_each = local.files

  bucket = module.s3_bucket.s3_bucket_id
  key    = each.value

  file_source  = "${local.static_directory}/${each.value}"
  content_type = endswith("${each.value}", "svg") ? "image/svg+xml" : "text/html"
  source_hash  = filemd5("${local.static_directory}/${each.value}")
}
