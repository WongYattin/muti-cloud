# 定義服務帳戶模組
module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 4.0"
  project_id    = var.project_id
  prefix        = "chat-bot"
  names         = ["backend"]
  project_roles = [
    "${var.project_id}=>roles/secretmanager.secretAccessor",
    "${var.project_id}=>roles/aiplatform.user",
    "${var.project_id}=>roles/cloudsql.client",
  ]
  generate_keys = true
}

# 將服務帳戶密鑰保存到本地文件
resource "local_file" "service_account_key_file" {
   content = module.service_accounts.key
  filename = "${path.module}/../langchain-gemini-server/key.json"
}



