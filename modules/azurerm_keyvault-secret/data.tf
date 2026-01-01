data "azurerm_key_vault" "mykv" {
  for_each = var.kvs
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}