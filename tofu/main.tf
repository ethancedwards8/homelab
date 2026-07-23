variable "account_id" {
  type = string
  default = "14a8704b05622c623affefb0d8dd93d4"
}

# fun
resource "cloudflare_r2_bucket" "tarball-cache-bucket" {
  account_id = var.account_id
  name = "tarball-cache"
  location = "ENAM"
}
