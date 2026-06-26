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

provider "cloudflare" {}

# theridgepodcast.com: "b6a388af6a4b1b20de9bcaf01f961dd3"
variable "zone_id" {
  default = "theridgepodcast.com"
}

# resource "cloudflare_r2_bucket" "test_bucket" {
#   account_id = "14a8704b05622c623affefb0d8dd93d4"
#   name = "test-by"
#   location = "ENAM"
# }

# resource "cloudflare_r2_bucket" "sftr_media_bucket" {
#   account_id = "14a8704b05622c623affefb0d8dd93d4"
#   name       = "sftr-media"
#   location   = "ENAM"
# }
