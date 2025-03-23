module "gke" {
source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-public-cluster"
  version = "36.0.2"
project_id = var.project_id
name =  "gke-cluster"
region = "us-central1"

zones = ["us-central1-a", "us-central1-b", "us-central1-c"]
network = "chat-bot-vpc"
subnetwork = "subnet-01"
ip_range_pods = "subnet-01-secondary-01"
ip_range_services = "subnet-01-secondary-02"
}