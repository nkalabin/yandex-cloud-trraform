resource "yandex_vpc_default_security_group" "default-sg" {
  description = var.description
  network_id  = var.network_id

  labels = {
    my-label = "test"
  }

}