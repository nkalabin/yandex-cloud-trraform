terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.192.0"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-d"
}

# provider "vault" {
#   address = "http://***:8200"
#   skip_child_token = true

#   auth_login {
#     path = "auth/approle/login"

#     parameters = {
#       role_id = "***"
#       secret_id = "***"
#     }
#   }
# }
