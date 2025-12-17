terraform {
  #  backend "azurerm" {
  #   resource_group_name  = "tfstate-rg"
  #   storage_account_name = "tfsurehsstate01"
  #   container_name       = "tfstate"
  #   key                  = "prod/vms/terraform.tfstate"
  # }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.55.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "711f9f70-1892-49fb-a04f-5bf2c5a89677"
}
