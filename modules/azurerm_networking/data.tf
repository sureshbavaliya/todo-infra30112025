data "azurerm_subnet" "frontend_subnet" {
  for_each = var.networking

  name                 = each.value.subnets[0].name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.name
}

data "azurerm_subnet" "backend_subnet" {
  for_each = var.networking

  name                 = each.value.subnets[1].name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.name
}