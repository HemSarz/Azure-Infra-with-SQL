## Resource Group
resource "azurerm_resource_group" "tfazrg" {
  name     = var.rgName
  location = var.location
}

## Storage Account
resource "azurerm_storage_account" "tfazstg" {
  name                     = var.StorageAccount
  resource_group_name      = azurerm_resource_group.tfazrg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfazcont01" {
  name                 = var.STGContainer
  storage_account_name = azurerm_storage_account.tfazstg.id
}