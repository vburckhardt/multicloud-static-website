variable "client_id" {
  type        = string
  description = "A description of my variable"
}

variable "client_secret" {
  type        = string
  description = "A description of my variable"
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = "A description of my variable"
}

variable "subscription_id" {
  type        = string
  description = "A description of my variable"
}

variable "prefix" {
  type        = string
  description = "Prefix added to all resources created in this module"
  default     = "demoweb"
}
