terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.52"
    }
  }
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  min_tls_version          = var.min_tls_version

  network_rules {
    default_action = var.sa_default_action
  }

  tags = var.tags
}

resource "azurerm_storage_container" "this" {
  storage_account_id    = azurerm_storage_account.this.id
  count                 = var.create_container ? 1 : 0
  name                  = var.container_name
  container_access_type = var.container_access_type
}
