# norm of file is append the type (bucket, domain)
# to local resource identifier

variable "theridgepodcast_zoneid" {
  type = string
  default = "b6a388af6a4b1b20de9bcaf01f961dd3"
}


# sftr-media.theridgepodcast.com
resource "cloudflare_r2_bucket" "sftr-media-bucket" {
  account_id = var.account_id
  name = "sftr-media"
  location = "ENAM"
}

resource "cloudflare_r2_custom_domain" "sftr-media-domain" {
  account_id = var.account_id
  bucket_name = "sftr-media"
  domain = "sftr-media.theridgepodcast.com"
  enabled = true
  zone_id = var.theridgepodcast_zoneid
  min_tls = "1.0"
}

# media.theridgepodcast.com
resource "cloudflare_r2_bucket" "theridgepodcast-media-bucket" {
  account_id = var.account_id
  name = "theridgepodcast-media"
  location = "ENAM"
}

resource "cloudflare_r2_custom_domain" "theridgepodcast-media-domain" {
  account_id = var.account_id
  bucket_name = "theridgepodcast-media"
  domain = "media.theridgepodcast.com"
  enabled = true
  zone_id = var.theridgepodcast_zoneid
  min_tls = "1.0"
}
