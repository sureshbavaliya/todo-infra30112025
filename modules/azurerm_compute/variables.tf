variable "vms" {
  type = map(object({
    vm_name              = string
    location             = string
    resource_group_name  = string
    size                 = string
    vnet_name            = string
    subnet_name          = string
    nic_name             = string
    pip_name             = optional(string)
    key_vault_name       = string
    key_vault_rg         = string
    key_vault_id         = optional(string)
    username_secret_name = string
    password_secret_name = string
  }))
}

