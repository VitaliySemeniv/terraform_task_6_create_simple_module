terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.52"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

variable "subscription_id" { type = string }
variable "tenant_id" { type = string }

module "rg_sa" {
  source  = "VitaliySemeniv/resource-group-storage/azurerm" # ✅ модуль із Terraform Registry
  version = "1.0.0"

  resource_group_name  = "rg-module-demo"
  location             = "westeurope"
  storage_account_name = "vitmodulersa123"
  tags = {
    owner = "vitaliy"
    env   = "lab"
  }
}

output "sa_name" {
  value = module.rg_sa.storage_account_name
}
