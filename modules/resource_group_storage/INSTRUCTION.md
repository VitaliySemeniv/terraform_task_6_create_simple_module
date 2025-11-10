# terraform-azurerm-resource-group-storage

Module creates:
- Resource Group
- Storage Account
- (optional) Blob Container

## Usage
```hcl
module "rg_sa" {
  source  = "github.com/<your-gh-user>/terraform-azurerm-resource-group-storage?ref=v1.0.0"

  resource_group_name   = "rg-demo"
  location              = "westeurope"
  storage_account_name  = "vitaliyrgsa123"
  tags = { project = "demo" }
}
