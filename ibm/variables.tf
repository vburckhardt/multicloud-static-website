variable "resource_group" {
 type        = string
 description = "A description of my variable"
 default = null
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Token"
  sensitive   = true
}

variable "prefix" {
 type        = string
 description = "Prefix added to all resources created in this module"
 default = "static-web-demo"
}

variable "region" {
  description = "Region where resources will be created"
  type        = string
  default     = "eu-gb"
}



