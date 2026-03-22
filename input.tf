variable "vm_map" {
  type = map(object({
    distro       = string
    cores        = optional(number, 2)
    memory       = optional(number, 2)
    disk_type    = optional(string, "network-hdd")
    disk_size    = optional(number, 10)
    public_ip    = optional(bool, true)
    subnet_name  = optional(string, "")
    core_fraction = optional(number, 20)
  }))
  default = {}
}

variable "network_names" {
  type = map(object({
  }))
  default = {}
}

variable "subnet_names" {
  type = map(object({
    parent_network = optional(string, "")
    cidr = set(string)
  }))
  default = {}
}