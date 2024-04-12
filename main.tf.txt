# Azurerm Provider configuration
provider "azurerm" {
  features {}
}

locals {
  tags = {
    ProjectName  = "dimiour-internal"
    Env          = "dev"
    Owner        = "user@example.com"
 
  }
}

module "vnet" {
  source  = "/Modules/Vnet"


  create_resource_group  = false
  resource_group_name    = "dimiour-rg-01"
  vnetwork_name          = "dimiour-vnet-01"
  location               = "westeurope"
  vnet_address_space     = ["10.2.0.0/16"]
  create_network_watcher = false

  subnets = {
    web_subnet = {
      subnet_name           = "subnet"
      subnet_address_prefix = ["10.2.1.0/24"]
      delegation = {
        name = "testdelegation"
        service_delegation = {
          name    = "Microsoft.Web/serverFarms"
          actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
      }
    }
  }
  tags = locals.tags
}

module "app-service" {
  source  = "Modules/Appservice"


  resource_group_name = "dimiour-rg-01"

  service_plan = {
    kind = "Windows"
    size = "S1"
    tier = "Standard"
  }
  app_service_name       = "dimiourpocproject"
  enable_client_affinity = true

  
  site_config = {
    always_on                 = true
    dotnet_framework_version  = "v6.0"
    ftps_state                = "FtpsOnly"
    managed_pipeline_mode     = "Integrated"
    use_32_bit_worker_process = true
    
  }

  
  app_settings = {
   
  }

  

  

}