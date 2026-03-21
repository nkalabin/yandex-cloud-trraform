variable "subnet_name" {
    type = string
    default = "test"
}

variable "network_id" {
    type = string
}

variable "cidr" {
    type = set(string)
}
