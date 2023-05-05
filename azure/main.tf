resource "azurerm_resource_group" "resource_group" {
  name     = "${var.prefix}-example-resources"
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.prefix}storacc"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version = "TLS1_2"

  #checkov:skip=CKV_AZURE_33: The bucket is a public static content host
  #checkov:skip=CKV_AZURE_206: No HA requirement for this demo
  #checkov:skip=CKV2_AZURE_18: Microsoft managed key are sufficient for this demo content
  #checkov:skip=CKV2_AZURE_1: Microsoft managed key are sufficient for this demo content
  #checkov:skip=CKV2_AZURE_33: Public access needed for static website
  #checkov:skip=CKV_AZURE_59: Public access needed for static website
  #checkov:skip=CKV_AZURE_190: Public access needed for static website

  static_website {
    index_document     = "index.html"
    error_404_document = "error.html"
  }
}

locals {
  static_directory = "${path.module}/../static"
  files            = fileset(local.static_directory, "*")
}

resource "azurerm_storage_blob" "file" {
  for_each               = local.files
  name                   = each.value
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  content_type           = "text/html"
  type                   = "Block"
  source                 = "${local.static_directory}/${each.value}"
  content_md5            = filemd5("${local.static_directory}/${each.value}")
}
