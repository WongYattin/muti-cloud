# 輸出資料庫實例名稱
output "db_instance_name" {
  description = "The name of the Cloud SQL database instance"
  value       = google_sql_database_instance.main.name
}

# 輸出資料庫名稱
output "db_name" {
  description = "The name of the database"
  value       = google_sql_database.database.name
}

# 輸出資料庫使用者名稱
output "db_user" {
  description = "The database user"
  value       = google_sql_user.users.name
}

# 輸出資料庫密碼
output "db_password" {
  description = "The password for the database user"
  value       = random_password.db_password.result
  sensitive   = true
}

output "db_ip" {
  description = "The IP address of the database instance"
  value       = google_sql_database_instance.main.first_ip_address
}

output "firestore_db_name" {
  description = "The name of the Firestore database"
  value       = google_firestore_database.main.name
}

# output "static_ip_address" {
#   description = "The static IP address"
#   value       = google_compute_address.static_ip.address
# }

# 輸出服務帳戶密鑰文件的路徑
output "service_account_key_file_path" {
  description = "服務帳戶 JSON 密鑰文件的本地路徑"
  value       = local_file.service_account_key_file.filename
}

output "api_key" {
  description = "The generated API key"
  value       = google_apikeys_key.chatbot.key_string
  sensitive   = true
}