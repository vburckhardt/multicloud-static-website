# variable "resource_group" {
#   type        = string
#   description = "Name of existing resource group to use.  Leave as null to create one with the given prefix value"
#   default     = null
# }

variable "access_key" {
  type        = string
  description = "The access key for API operations. You can retrieve this from the 'Security & Credentials' section of the AWS console."
}

variable "secret_key" {
  type        = string
  description = "The secret key for API operations. You can retrieve this from the 'Security & Credentials' section of the AWS console."
  sensitive   = true
}

variable "region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "eu-west-1"
}

variable "prefix" {
  type        = string
  description = "Prefix added to all resources that will be created"
  default     = "static-web-demo"
}
