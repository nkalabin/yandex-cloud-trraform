#terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
#terraform plan -generate-config-out=generated.tf
#echo 'split(",", "foo,bar,baz")' | terraform console
#depend_on
#count

# data "vault_kv_secret_v2" "example" {
#   mount = "secret"
#   name  = "secret"
# }

# import {
#   id =  "terraform-nkalabin"
  
#   to = yandex_storage_bucket.import
# }

locals {
  tag = {
    managed_by_terraform = "true"
  }
}

module "yandex_vpc_network" {
  source = "./modules/yandex_vpc_network"
  for_each = var.network_names
  network_name = each.key
}

module "yandex_vpc_subnet" {
  source = "./modules/yandex_vpc_subnet"
  network_id = module.yandex_vpc_network["${each.value.parent_network}"].network_id
  for_each = var.subnet_names
  subnet_name = each.key
  cidr = each.value.cidr
}

module "yandex_vpc_default_security_group" {
  source = "./modules/yandex_vpc_default_security_group"
  for_each = var.network_names
  network_id = module.yandex_vpc_network["${each.key}"].network_id
}

module "yandex_vpc_security_group" {
  source = "./modules/yandex_vpc_security_group"
  for_each = var.network_names
  network_id = module.yandex_vpc_network["${each.key}"].network_id

}

module "yandex_instance" {
  source = "./modules/yandex_compute_instance"
  for_each = var.vm_map
  vm_name     = each.key
  distro_type = each.value.distro
  cpus = each.value.cores
  memory = each.value.memory
  disk_type = each.value.disk_type
  disk_size = each.value.disk_size
  public_ip = each.value.public_ip
  core_fraction = each.value.core_fraction
  subnet_id = module.yandex_vpc_subnet["${each.value.subnet_name}"].subnet_id
}


output "public_ip" {
  value = {
    for k, m in module.yandex_instance : k => m.internal_ip_address_vm_1
  }
}