# Configure the Azure provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dimiour" {
    name = "DimiourRG"
    location = "Eastus"
}

resource "azurerm_app_service_plan" "dimiour" {
    name                = "dimiourasp"
    location            = azurerm_resource_group.dimiour.location
    resource_group_name = azurerm_resource_group.dimiour.name
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "dimiour" {
    name                = "dimiourAppService"
    location            = azurerm_resource_group.dimiour.location
    resource_group_name = azurerm_resource_group.dimiour.name
    app_service_plan_id = azurerm_app_service_plan.dimiour.id
}

resource "azurerm_app_service_slot" "dimiour" {
    name                = "dimiourblueslot"
    location            = azurerm_resource_group.dimiour.location
    resource_group_name = azurerm_resource_group.dimiour.name
    app_service_plan_id = azurerm_app_service_plan.dimiour.id
    app_service_name    = azurerm_app_service.dimiour.name
}