variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "env" {
  description = "The environment name (e.g., dev, qa, prod)"
  type        = string
}

variable "admin_user_object_id" {
  description = "The Object ID of the user managing the Project Admin group"
  type        = string
}

variable "ops_user_object_id" {
  description = "The Object ID of the user managing the Ops group"
  type        = string
}

variable "dev_user_object_id" {
  description = "The Object ID of the user managing the Developer group"
  type        = string
}
