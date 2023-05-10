terraform {

  backend "azurerm" {
    storage_account_name = "shivanitests"
    container_name       = "statefileshivani"
    key                  = "tfstate"
  }
}
