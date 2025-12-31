resource "azurerm_key_vault_secret" "kvs" { 
  for_each = var.kvs

  name         = each.value.kvs.name
  value        = each.value.value
  key_vault_id = each.value.key_vault_id
}