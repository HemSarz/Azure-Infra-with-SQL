data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

data "azuread_service_principal" "tfazsp" {
  display_name = "tfazsp"
}

data "azurerm_key_vault" "bckndKV" {
  name                = "tfazkv"
  resource_group_name = data.azurerm_resource_group.tfazrgbackend.name
}

data "azurerm_resource_group" "tfazrgbackend" {
  name = "tfazbackend"
}


/* ## BackendKVRG

data "azurerm_resource_group" "tfazrgbackend" {
  name = "tfazbackend"
}

data "azurerm_key_vault" "bckndKV" {
  name                = "tfazkv"
  resource_group_name = data.azurerm_resource_group.tfazrgbackend.name
}

#Fetch SSHKey
data "azurerm_key_vault_secret" "sshKey" {
  name         = "tfazlnx"
  key_vault_id = data.azurerm_key_vault.bckndKV.id

  depends_on = [azurerm_key_vault_access_policy.tfazbckndap]

}*/