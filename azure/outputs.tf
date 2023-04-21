
##############################################################################
# Outputs
##############################################################################

output "url" {
  description = "url"
  value       = azurerm_storage_account.storage_account.primary_web_endpoint
}
