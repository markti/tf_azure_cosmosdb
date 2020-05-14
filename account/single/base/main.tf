resource "azurerm_cosmosdb_account" "account" {
  name                = "${var.name}-${random_string.random.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level       = "Eventual"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
  
  tags = {
    app = var.app_name
    env = var.env_name
  }

}

resource "random_string" "random" {
  length = 8
  special = false
  lower = true
  upper = false
}