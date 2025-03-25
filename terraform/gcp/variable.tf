variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
  default     = "vtc-ai-440901"
}

variable "region" {
  description = "Default Region"
  type        = string
  default     = "asia-east2"
}

variable "db_instance_name" {
  description = "Cloud SQL instance name"
  type        = string
  default     = "vtc-postgres"
}

variable "db_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "POSTGRES_15"
}

variable "vpc_id" {
  description = "VPC network ID"
  type        = string
  default     = "default"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "vtc_chatbot"
}

variable "db_user" {
  description = "Database user"
  type        = string
  default     = "vtc_admin"
}


variable "instance_tier" {
  description = "Database instance tier"
  type        = string
  default     = "db-f1-micro"
}