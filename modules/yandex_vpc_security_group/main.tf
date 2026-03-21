resource "yandex_vpc_security_group" "sg1" {
  name        = var.sec_group_name
  description = var.description
  network_id  = var.network_id

  labels = {
    my-label = "test"
  }

  ingress {
    protocol       = "TCP"
    description    = "Allow HTTP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 8080
  }
  ingress {
    protocol       = "TCP"
    description    = "Allow ssh"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
  egress {
    protocol       = "ANY"
    description    = "egress any"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}