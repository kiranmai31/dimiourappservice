resource "azurerm_resource_group" "dimiour" {
  name     = "Dimoiurrg"
  location = "Eastus"
}



resource "azurerm_virtual_network" "example" {
  name                = "dimiour-network"
  location            = azurerm_resource_group.dimiour.location
  resource_group_name = azurerm_resource_group.dimiour.name
  address_space       = ["10.0.0.0/16"]
  

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  tags = {
    environment = "dev"
  }
}