output "key_vault_ids" {
  value = {
    for k, v in azurerm_key_vault.mykv :
    k => v.id
  }
}

output "key_vault_names" {
  value = {
    for k, v in azurerm_key_vault.mykv :
    k => v.name
  }
}
