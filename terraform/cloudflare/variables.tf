variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "cloudflare_domain" {
  description = "Domain name managed by Cloudflare"
  type        = string
}

variable "azure_lb_ip" {
  description = "Azure Kubernetes Load Balancer IP"
  type        = string
}

variable "gcp_lb_ip" {
  description = "GCP Kubernetes Load Balancer IP"
  type        = string
}