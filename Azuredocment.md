**Terraform with Azure**
1.Create the modules folder
2.Create the main.tf for appservice inside resource code.
3.create the main.tf file for appservice with vnet
4.Download the terraform tool
5.Authenticate with azure using azure cli
Az login
Az login —service-principal -u- “clientid” -p -“client-secret” — tenant”tenanat-id
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = ""
}
6.Initalize terraform using terraform init command
7.validate the configuration file using terraform validate
8.plan will generate execution plan using terraform plan command
9.create or update infrastructure using terraform apply command

