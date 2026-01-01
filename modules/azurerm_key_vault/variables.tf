variable "mykv" {
  type = map(object({
    kv_name  = string
    location = string
    rg_name  = string
  }))
}