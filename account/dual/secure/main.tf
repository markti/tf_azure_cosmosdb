
module "account" {
  
  source              = "../base"

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  app_name            = var.app_name
  env_name            = var.env_name

  failover_location   = var.failover_location

}


module "secret_connection_string" {
  
  source                = "github.com/markti/tf_azure_keyvault/secret"

  keyvault_id           = var.keyvault_id
  
  name                  = "${var.secret_prefix}-ConnectionString"
  value                 = module.account.connection_strings[0]

  app_name              = var.app_name
  env_name              = var.env_name

}