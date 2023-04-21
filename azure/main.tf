resource "azurerm_resource_group" "resource_group" {
  name     = "${var.prefix}-example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.prefix}storacc"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document = "index.html"
    error_404_document = "error.html"
  }
}

locals {
  static_directory = "${path.module}/../static"
  files = fileset(local.static_directory, "*")
}

resource "azurerm_storage_blob" "file" {
  for_each = local.files
  name                   = each.value
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  content_type = "text/html"
  type                   = "Block"
  source                 = "${local.static_directory}/${each.value}"
  content_md5 = filemd5("${local.static_directory}/${each.value}")
}