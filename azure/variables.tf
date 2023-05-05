variable "client_id" {
  type        = string
  description = "The Client ID which should be used. Refer to https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret"
}

variable "client_secret" {
  type        = string
  description = "The Client Secret which should be used. Refer to https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret"
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = " The Tenant ID which should be used. Refer to https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret"
}

variable "subscription_id" {
  type        = string
  description = "The Subscription ID which should be used. Refer to https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret"
}

variable "prefix" {
  type        = string
  description = "Prefix added to all resources created in this module"
  default     = "demoweb"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resources are provisioned."
  default     = "West Europe"
}
