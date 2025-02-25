terraform {
  required_version = ">= 1.6.0"

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateaccount"
    container_name       = "tfstate"
    key                 = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "dev" {
  source = "./environments/dev"
}

module "qa" {
  source = "./environments/qa"
}

module "prod" {
  source = "./environments/prod"
}
