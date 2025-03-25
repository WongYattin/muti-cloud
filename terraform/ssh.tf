resource "tls_private_key" "ssh_key" {
  algorithm = "ED25519"
}

# 將私鑰輸出到本地檔案
resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/ssh_key.pem"
  file_permission = "0600"  # 安全的檔案權限
}