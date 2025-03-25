module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster"
  version = "27.0.0"
  
  project_id = var.project_id
  name       = "gke-private-cluster"
  region     = var.region
  zones      = ["us-central1-a", "us-central1-b", "us-central1-c"]
  
  network                 = module.vpc.network_name
  subnetwork              = "subnet-01"
  ip_range_pods           = "subnet-01-secondary-01"
  ip_range_services       = "subnet-01-secondary-02"
  
  # 私有節點，但允許從特定 IP 訪問控制平面
  enable_private_nodes    = true
  enable_private_endpoint = false  # 允許從指定 IP 範圍訪問控制平面
  
  master_ipv4_cidr_block  = "172.16.0.0/28"
  
  # 您可以在這裡添加您的辦公室/開發環境 IP
  master_authorized_networks = [
    {
      cidr_block   = "0.0.0.0/0"  # 在開發環境可允許所有 IP。生產環境中應該限制為特定 IP
      display_name = "Allowed IPs"
    }
  ]
  
  # 節點設定
  remove_default_node_pool = true
  initial_node_count       = 1
  
  node_pools = [
    {
      name               = "default-pool"
      machine_type       = "e2-medium"
      node_locations     = "us-central1-a,us-central1-b"
      min_count          = 1
      max_count          = 3
      disk_size_gb       = 100
      disk_type          = "pd-standard"
      auto_repair        = true
      auto_upgrade       = true
      preemptible        = false
    }
  ]
}