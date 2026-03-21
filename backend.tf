terraform {
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
      dynamodb = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g1evjg1313adh3k2jl/etntn6v5hu9bv42ejnrj"
    }
    bucket = "terraform-nkalabin"
    region = "ru-central1"
    key    = "terraform.tfstate"
    dynamodb_table = "table498"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # Необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

  }
}
