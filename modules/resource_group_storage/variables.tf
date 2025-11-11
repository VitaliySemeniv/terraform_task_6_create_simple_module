variable "resource_group_name" { type = string }
variable "location" { type = string }

variable "storage_account_name" { type = string }

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "replication_type" {
  type    = string
  default = "LRS"
}

# Заміна для v4.x (замість allow_blob_public_access)
variable "allow_nested_items_to_be_public" {
  type    = bool
  default = false
}

variable "min_tls_version" {
  type    = string
  default = "TLS1_2"
}

variable "sa_default_action" {
  type    = string
  default = "Allow" # або "Deny", якщо треба
}

variable "create_container" {
  type    = bool
  default = true
}

variable "container_name" {
  type    = string
  default = "tfstate"
}

variable "container_access_type" {
  type    = string
  default = "private"
}

variable "tags" {
  type    = map(string)
  default = {}
}
