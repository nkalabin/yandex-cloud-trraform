variable "vm_name" {
    type = string
}

variable "subnet_id" {
    type = string
}

variable "distro_type" {
  type = string
}

variable "distro_map" {
  type = map(string)
  default = {
    "ubuntu_24" = "fd8e5jmcvep85j33nt0e"
    "ubuntu_22" = "fd8rnq92aj5v7sgi91e8"
  }
}

#variable "ssh_key" {
#  type=string
#}

variable "public_ip" {
  type=string
  default = "true"
}

variable "disk_type" {
    type = string
    default = "network-hdd"
}

variable "disk_size" {
    type = string
    default = "10"
}

variable "cpus" {
    type = string
    default = "2"
}

variable "memory" {
    type = string
    default = "2"
}

variable "core_fraction" {
  type = string
  default = "20"
}