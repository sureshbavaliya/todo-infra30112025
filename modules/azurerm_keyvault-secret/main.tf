resource "azurerm_key_vault_secret" "kvs" { 
  for_each = var.kvs

  name         = each.value.kvs.name
  value        = each.value.value
  key_vault_id = each.value.key_vault_id
}
resource "azurerm_key_vault_secret" "admin_username" {
  for_each     = var.kvs
  name         = "vm-admin-username"
  value        = "azureadmin"
  key_vault_id = data.azurerm_key_vault.mykv[each.key].id
}

resource "azurerm_key_vault_secret" "admin_password" {
  for_each     = var.kvs
  name         = "vm-admin-password"
  value        = "P@ssw0rd@123"
  key_vault_id = data.azurerm_key_vault.mykv[each.key].id
}
