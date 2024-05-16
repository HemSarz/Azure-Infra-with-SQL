data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

data "azuread_service_principal" "tfazspn" {
  display_name = "tfazsp"
}
