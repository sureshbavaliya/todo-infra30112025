terraform {
  #  backend "azurerm" {
  #   resource_group_name  = "suresh-rg"
  #   storage_account_name = "storageacct01"
  #   container_name       = "appcontainer"
  #   key                  = "prod.terraform.tfstate"
  # }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.59.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e75903f7-32f6-44d4-822d-7e30295392ea"
}
