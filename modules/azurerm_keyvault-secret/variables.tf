variable "kvs" {
  type = map(object({
    kvsid = object({
      name = string
    })
    value        = string
    key_vault_id = string
  }))
}