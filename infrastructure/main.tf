module "rgs" {
  source = "../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "storage" {
  depends_on = [module.rgs]
  source     = "../modules/azurerm_storage_account"
  storage    = var.storages
}

module "network" {
  depends_on = [module.rgs]
  source     = "../modules/azurerm_networking"
  networking = var.networking
}


module "mykv" {
  depends_on = [module.rgs]
  source     = "../modules/azurerm_key_vault"
  mykv       = var.mykv
}

module "public_ips" {
  depends_on = [module.network, module.rgs]
  source     = "../modules/azurerm_public_ip"
  pip        = var.pip
}

module "vms" {
  depends_on = [module.public_ips, module.network, module.mykv]
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
