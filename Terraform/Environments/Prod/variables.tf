variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "env" {
  description = "The environment name"
  type        = string
  default     = "prod"
}
