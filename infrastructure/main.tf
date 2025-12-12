module "rgs" {
  source = "../modules/azurerm_resource_group"
  rgs    = var.rgs

}

module "network" {
  depends_on = [module.rgs]
  source     = "../modules/azurerm_networking"
  networking = var.networking
}

module "public_ip" {
  depends_on = [module.network]
  source     = "../modules/azurerm_public_ip"
  pip        = var.pip
}

module "key_vault" {
depends_on = [module.rgs , module.network]
  source     = "../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "vms" {
  depends_on = [module.public_ip, module.key_vault, module.network, module.rgs]
  source     = "../modules/azurerm_compute"
  vms        = var.vms
}

# module "sql_server" {
#   depends_on      = [module.rg]
#   source          = "../../modules/azurerm_sql_server"
#   sql_server_name = "sql-dev-todoapp-786"
#   rg_name         = "rg-dev-todoapp-01"
#   location        = "centralindia"
#   admin_username  = "devopsadmin"
#   admin_password  = "P@ssw01rd@123"
#   tags            = {}
# }

# module "sql_db" {
#   depends_on  = [module.sql_server]
#   source      = "../../modules/azurerm_sql_database"
#   sql_db_name = "sqldb-dev-todoapp"
#   server_id   = module.sql_server.server_id
#   max_size_gb = "2"
#   tags        = {}
# }
