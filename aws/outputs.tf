
##############################################################################
# Outputs
##############################################################################

# output "url" {
#   description = "url"
#   value       = azurerm_storage_account.example.primary_web_endpoint
# }

output "url" {
  description = "url"
  value       = "http://${module.s3_bucket.s3_bucket_website_endpoint}"
}
