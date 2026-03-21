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

resource "yandex_storage_bucket" "import" {
  access_key              = null
  bucket                  = "terraform-nkalabin"
  bucket_prefix           = null
  default_storage_class   = "STANDARD"
  disabled_statickey_auth = false
  folder_id               = "b1gcm547q13gknndie00"
  force_destroy           = null
  max_size                = 2147483648
  secret_key              = null # sensitive
  tags                    = local.tag
  anonymous_access_flags {
    config_read = false
    list        = false
    read        = false
  }
  versioning {
    enabled = false
  }
}

# module "yandex_vpc_network" {
#   source = "./modules/yandex_vpc_network"
#   network_name = "test_network"
# }

# module "yandex_vpc_subnet" {
#   source = "./modules/yandex_vpc_subnet"
#   network_id = module.yandex_vpc_network.network_id
#   cidr = ["192.168.10.0/24"]
# }

# module "yandex_vpc_default_security_group" {
#   source = "./modules/yandex_vpc_default_security_group"
#   network_id = module.yandex_vpc_network.network_id
# }

# module "yandex_vpc_security_group" {
#   source = "./modules/yandex_vpc_security_group"
#   network_id = module.yandex_vpc_network.network_id

# }

# module "yandex_instance" {
#   source = "./modules/yandex_compute_instance"
#   for_each = var.vm_map
#   vm_name     = each.key
#   distro_type = each.value.distro
#   cpus = each.value.cores
#   memory = each.value.memory
#   disk_type = each.value.disk_type
#   disk_size = each.value.disk_size
#   public_ip = each.value.public_ip
#   core_fraction = each.value.core_fraction
#   subnet_id = module.yandex_vpc_subnet.subnet_id
#   security_group_ids = module.yandex_vpc_security_group.sec_group_id
# }


# output "public_ip" {
#   value = {
#     for k, m in module.yandex_instance : k => m.internal_ip_address_vm_1
#   }
# }