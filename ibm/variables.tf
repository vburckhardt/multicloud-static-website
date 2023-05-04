variable "resource_group" {
  type        = string
  description = "Name of existing resource group to use.  Leave as null to create one with the given prefix value"
  default     = null
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Token from an account with sufficient permissions to deploy resources"
  sensitive   = true
}

variable "prefix" {
  type        = string
  description = "Prefix added to all resources created in this module"
  default     = "static-web-demo"
}

variable "region" {
  description = "Region where resources will be created"
  type        = string
  default     = "eu-gb"
}
