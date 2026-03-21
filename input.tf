variable "vm_map" {
  type = map(object({
    distro       = string
    cores        = optional(number, 2)
    memory       = optional(number, 2)
    disk_type    = optional(string, "network-hdd")
    disk_size    = optional(number, 10)
    public_ip    = optional(bool, true)
    core_fraction = optional(number, 20)
  }))
  default = {}
}

