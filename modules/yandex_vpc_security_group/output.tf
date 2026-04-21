output "sec_group_id" {
  value = toset([yandex_vpc_security_group.sg1.id])
}