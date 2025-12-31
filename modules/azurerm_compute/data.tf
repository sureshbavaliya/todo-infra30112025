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

data "azurerm_key_vault" "mykv" {
  for_each = var.vms

  name                = each.value.kv.name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "vm_username" {
  for_each     = var.vms
  name         = each.value.vm_username
  key_vault_id = each.value.key_vault_id
}

data "azurerm_key_vault_secret" "vm_password" {
  for_each     = var.vms
  name         = each.value.vm_password
  key_vault_id = each.value.key_vault_id
}


data "azurerm_public_ip" "pip" {
  for_each            = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}


