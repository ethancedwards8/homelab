# norm of file is append the type (bucket, domain)
# to local resource identifier

resource "cloudflare_r2_bucket" "tarball-cache-bucket" {
  account_id = var.account_id
  name = "tarball-cache"
  location = "ENAM"
}
