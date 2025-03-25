terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.11"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" { # 同樣為 azapi 提供者設置
}