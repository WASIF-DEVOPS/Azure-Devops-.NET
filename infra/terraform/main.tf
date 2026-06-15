terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "eshop-tfstate-rg"
    storage_account_name = "eshoptfstate"
    container_name       = "tfstate"
    key                  = "eshop.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "random" {}

# ── Auto-generate all passwords — no human ever sees or types them ────────────
resource "random_password" "db" {
  length  = 24
  special = false
}

resource "random_password" "redis" {
  length  = 24
  special = false
}

resource "random_password" "rabbitmq" {
  length  = 24
  special = false
}

# ── Resource Group ─────────────────────────────────────────────────────────────
resource "azurerm_resource_group" "eshop" {
  name     = "eshop-${var.environment}-rg"
  location = var.location
}

# ── Modules ───────────────────────────────────────────────────────────────────
module "acr" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.eshop.name
  location            = var.location
  environment         = var.environment
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.eshop.name
  location            = var.location
  environment         = var.environment
  acr_id              = module.acr.acr_id
}

module "postgres" {
  source              = "./modules/postgres"
  resource_group_name = azurerm_resource_group.eshop.name
  location            = var.location
  postgres_location   = var.postgres_location
  environment         = var.environment
  admin_password      = random_password.db.result
}

module "redis" {
  source              = "./modules/redis"
  resource_group_name = azurerm_resource_group.eshop.name
  location            = var.location
  environment         = var.environment
}

module "rabbitmq" {
  source              = "./modules/rabbitmq"
  resource_group_name = azurerm_resource_group.eshop.name
  location            = var.location
  environment         = var.environment
}

# Key Vault stores all generated secrets — pipeline & AKS read from here
module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.eshop.name
  location            = var.location
  environment         = var.environment
  aks_principal_id    = module.aks.aks_principal_id
  db_password         = random_password.db.result
  redis_password      = random_password.redis.result
  rabbitmq_password   = random_password.rabbitmq.result
}
