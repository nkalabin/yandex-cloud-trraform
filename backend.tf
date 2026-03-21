terraform {
  backend "s3" {
    bucket = "terraform-nkalabin"
    region = "ru-central1"
    key    = "terraform.tfstate"
    dynamodb_table = "table498"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true

  }
}
