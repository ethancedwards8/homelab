# https://developers.cloudflare.com/terraform/tutorial/

# norm of file is append the type (_bucket, _domain)
# to local resource identifier

terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
    }
  }
}

resource "cloudflare_r2_bucket" "homelab-tf-state-bucket" {
  account_id = "14a8704b05622c623affefb0d8dd93d4"
  name = "homelab-tf-state-bucket"
  location = "ENAM"
}
