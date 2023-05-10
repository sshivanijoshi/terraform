terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}


provider "azurerm" {
  tenant_id       = "*********************"
  subscription_id = "*********************"
  client_id       = "*********************"
  client_secret   = "*********************"

  features {}
}

