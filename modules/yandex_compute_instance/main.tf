resource "yandex_compute_disk" "test-disk" {
  name     = "disk-${var.vm_name}"
  type     = var.disk_type
  size     = var.disk_size
  image_id = lookup(var.distro_map, var.distro_type)
}

resource "yandex_compute_instance" "vm-1" {
  name = var.vm_name
  platform_id = "standard-v3"

  resources {
    core_fraction = var.core_fraction
    cores  = var.cpus
    memory = var.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.test-disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.public_ip
  }

  metadata = {
    user-data = "${file("./cloud-init/linux/meta.txt")}"
  }
}