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
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "tfazcont01" {
  name                 = var.STGContName
  storage_account_name = azurerm_storage_account.tfazstg.id
}

## KeyVault
resource "azurerm_key_vault" "tfazkv" {
  name                = var.kVName
  location            = var.location
  resource_group_name = azurerm_resource_group.tfazrg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.sku_name
}

resource "azurerm_key_vault_access_policy" "spacc" {
  key_vault_id    = azurerm_key_vault.tfazkv.id
  tenant_id       = data.azurerm_client_config.current.tenant_id
  object_id       = data.azuread_service_principal.tfazsp.object_id
  key_permissions = ["Get", "List", "Set"]
}

resource "azurerm_virtual_network" "tfazvnet" {
  name = ""

}