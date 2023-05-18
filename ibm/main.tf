module "resource_group" {
  source = "git::https://github.com/terraform-ibm-modules/terraform-ibm-resource-group.git?ref=v1.0.5"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

resource "random_string" "bucket_name_suffix" {
  length  = 4
  special = false
  upper   = false
}

module "cos_instance_bucket" {
  source                    = "git::https://github.com/terraform-ibm-modules/terraform-ibm-cos?ref=v6.2.0"
  resource_group_id         = module.resource_group.resource_group_id
  region                    = var.region
  cos_instance_name         = "${var.prefix}-cos"
  bucket_name               = "${var.prefix}-web-bucket-${random_string.bucket_name_suffix.id}"
  encryption_enabled        = false
  retention_enabled         = false
  create_hmac_key           = false
  object_versioning_enabled = false
  archive_days              = null
  expire_days               = null
}

locals {
  static_directory = "${path.module}/../static"
  files            = fileset(local.static_directory, "*")
}

resource "ibm_cos_bucket_object" "file" {
  for_each        = local.files
  bucket_crn      = module.cos_instance_bucket.bucket_crn[0]
  bucket_location = var.region
  content_file    = "${local.static_directory}/${each.value}"
  key             = each.value
  etag            = filemd5("${local.static_directory}/${each.value}")
}

# Make the bucket public (anonymous access)

data "ibm_iam_access_group" "public_access" {
  access_group_name = "Public Access"
}

resource "ibm_iam_access_group_policy" "cos_public_access_policy" {
  access_group_id = data.ibm_iam_access_group.public_access.groups[0].id

  roles = ["Object Reader"]

  resources {
    service              = "cloud-object-storage"
    resource_instance_id = module.cos_instance_bucket.cos_instance_guid
    resource_type        = "bucket"
    resource             = module.cos_instance_bucket.bucket_name[0]
  }
}

## No support in IBM Cloud terraform provider for this operation
## See https://github.com/IBM-Cloud/terraform-provider-ibm/issues/3354
resource "null_resource" "configure_cos_bucket_static_website" {
  provisioner "local-exec" {
    command     = "${path.module}/scripts/cos-website-config.sh ${var.region} ${module.resource_group.resource_group_id} ${module.cos_instance_bucket.bucket_name[0]} ${path.module}/scripts/bucket-config.json"
    interpreter = ["/bin/bash", "-c"]
    environment = {
      IBMCLOUD_API_KEY = var.ibmcloud_api_key
    }
  }
}
