data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

data "azuread_service_principal" "tfazsp" {
  display_name = "tfazsp"
}

#Fetch SSHKey
data "azurerm_key_vault" "tfazkv" {
  name                = azurerm_key_vault.tfazkv.name
  resource_group_name = azurerm_resource_group.tfazrg.name
}

data "azurerm_key_vault_secret" "sshKey" {
  name         = "tfazlnx"
  key_vault_id = data.azurerm_key_vault.tfazkv.id

}