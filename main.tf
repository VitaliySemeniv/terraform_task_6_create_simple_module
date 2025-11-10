terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.52"
    }
  }
}

# ЄДИНИЙ блок провайдера в корені
provider "azurerm" {
  features {}
  # щоб не ловити "subscription ID could not be determined":
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

variable "subscription_id" { type = string }
variable "tenant_id" { type = string }

module "rg_sa" {
  source = "./modules/resource_group_storage"

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
