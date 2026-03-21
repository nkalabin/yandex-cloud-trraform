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
#   address = "http://213.165.213.51:8200"
#   skip_child_token = true

#   auth_login {
#     path = "auth/approle/login"

#     parameters = {
#       role_id = "bde10962-b65d-4614-df8c-1b01d1646e64"
#       secret_id = "ec87f040-3403-d62a-8048-63d5a2f153da"
#     }
#   }
# }
