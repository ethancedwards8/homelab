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

