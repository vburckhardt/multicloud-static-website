
##############################################################################
# Outputs
##############################################################################

# output "url" {
#   description = "url"
#   value       = azurerm_storage_account.example.primary_web_endpoint
# }

output "url" {
  description = "url"
  value       = "https://${module.cos_instance_bucket.bucket_name[0]}.s3-web.${var.region}.cloud-object-storage.appdomain.cloud"
}
