resource "yandex_vpc_subnet" "subnet-1" {
  name           = var.subnet_name
  network_id     = var.network_id
  #default_security_group_id = 
  v4_cidr_blocks = var.cidr
}
