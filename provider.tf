terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.102.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "2.49.1"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfazbackend"
    storage_account_name = "tfazbackendstg"
    container_name       = "contbknd"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azuread" {
  tenant_id = var.tenant_id
}

