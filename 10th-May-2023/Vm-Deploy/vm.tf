resource "azurerm_resource_group" "shivani_resource_group" {
  name     = "ShivaniRgVM"
  location = "UK South"
}

resource "azurerm_virtual_network" "shivani_VN" {
  name                = "shivanivnetwork"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.shivani_resource_group.location
  resource_group_name = azurerm_resource_group.shivani_resource_group.name
}

resource "azurerm_subnet" "shivani_subnet" {
  name                 = "shivanisubnet"
  resource_group_name  = azurerm_resource_group.shivani_resource_group.name
  virtual_network_name = azurerm_virtual_network.shivani_VN.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "shivani_nic" {
  name                = "shivani-nic"
  location            = azurerm_resource_group.shivani_resource_group.location
  resource_group_name = azurerm_resource_group.shivani_resource_group.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.shivani_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "shivani_vm" {
  name                = "shivani-machine"
  resource_group_name = azurerm_resource_group.shivani_resource_group.name
  location            = azurerm_resource_group.shivani_resource_group.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "****"
  network_interface_ids = [
    azurerm_network_interface.shivani_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

}


  
