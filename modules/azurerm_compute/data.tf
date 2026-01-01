data "azurerm_virtual_network" "vnet" {
  for_each            = var.vms
  name                = each.value.vnet_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "frontend" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
  for_each            = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "mykv" {
  for_each = var.vms

  name                = each.value.key_vault_name
  resource_group_name = each.value.key_vault_rg
}

data "azurerm_key_vault_secret" "admin_username" {
  for_each     = var.vms
  name         = each.value.username_secret_name
  key_vault_id = data.azurerm_key_vault.mykv[each.key].id
}

data "azurerm_key_vault_secret" "admin_password" {
  for_each     = var.vms
  name         = each.value.password_secret_name
  key_vault_id = data.azurerm_key_vault.mykv[each.key].id
}
