terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudfl"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}