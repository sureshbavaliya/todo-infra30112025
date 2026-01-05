data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "mykv" {
  for_each = var.mykv

  name                = each.value.kv_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  enabled_for_disk_encryption = true
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = true

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    ip_rules       = ["103.240.169.179/32"]
  }

  lifecycle {
    ignore_changes = [
      soft_delete_retention_days
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List"
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge"
    ]

    storage_permissions = [
      "Get",
      "List"
    ]
  }

  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}
