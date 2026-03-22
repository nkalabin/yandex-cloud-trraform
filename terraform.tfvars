vm_map = {
  prod_1 = {
    distro    = "ubuntu_24"
    cores     = 2
    memory    = 4
    public_ip = true
    subnet_name = "test_subnet"
  }
  prod_2 = {
    distro = "ubuntu_22"
    cores  = 2
    memory = 2
    public_ip = true
    subnet_name = "obeme"
  }
}

network_names = {
  test_network = {}
}

subnet_names = {
  test_subnet = {
    cidr = ["10.5.0.0/24"]
    parent_network = "test_network"
  }
  obeme = {
    cidr = ["192.168.10.0/24"]
    parent_network = "test_network"
  }
}