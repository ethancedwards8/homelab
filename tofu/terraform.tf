# https://developers.cloudflare.com/terraform/tutorial/

# norm of file is append the type (bucket, domain)
# to local resource identifier

# https://stackoverflow.com/questions/62453985/terraform-convention-should-i-declare-a-constant-as-a-variable-or-local
locals {
  state_bucket = "homelab-tf-state"
  account_id = "14a8704b05622c623affefb0d8dd93d4"
}

# https://spacelift.io/blog/terraform-secrets
# using TF_VAR env vars
variable "state_access_key" {
  type = string
}

variable "state_secret_key" {
  type = string
}

terraform {
  # https://developers.cloudflare.com/terraform/advanced-topics/remote-backend/
  backend "s3" {
    bucket = local.state_bucket
    key    = "homelab/terraform.tfstate"
    region                      = "auto"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
    use_lockfile                = true
    access_key                  = var.state_access_key
    secret_key                  = var.state_secret_key
    endpoints = { s3 = "https://${local.account_id}.r2.cloudflarestorage.com" }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
    }
  }
}

resource "cloudflare_r2_bucket" "homelab-tf-state-bucket" {
  account_id = local.account_id
  name = "homelab-tf-state"
  location = "ENAM"
}
