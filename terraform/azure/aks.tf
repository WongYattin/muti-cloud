

# Define the module for AKS with Cluster Autoscaler
module "aks" {
  source  = "Azure/aks/azurerm"
  version = "7.5.0"  # Use the latest compatible version as of March 18, 2025

  # Cluster basics
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  cluster_name        = "AKSCluster"
  prefix              = "akscluster"  # DNS prefix

  # Node pool configuration with Cluster Autoscaler
  agents_size           = "Standard_D2_v2"
  agents_count          = 2             # Starting with 2 VMs
  agents_min_count      = 2             # Minimum nodes for autoscaling
  agents_max_count      = 4             # Maximum nodes for autoscaling
  vnet_subnet_id        = azurerm_subnet.private1.id
  enable_auto_scaling   = true          # Explicitly enables Cluster Autoscaler
  agents_availability_zones    = ["1", "2"]    # Distribute across zones 1 and 2

  # Network configuration
  network_plugin        = "azure"
  load_balancer_sku     = "standard"

  # Private cluster configuration
  private_cluster_enabled = true

  # Identity configuration
  identity_type = "SystemAssigned"

  # Log Analytics integration (OMS Agent equivalent)
  log_analytics_workspace_enabled = true 
  
  rbac_aad = false

  depends_on = [
    azurerm_resource_group.example,
    azurerm_subnet.private1,
    azurerm_log_analytics_workspace.example
  ]
}

# Assumptions: These resources are already defined elsewhere in your code
# - azurerm_resource_group.example
# - azurerm_subnet.private1
# - azurerm_log_analytics_workspace.example

resource "azurerm_log_analytics_workspace" "example" {
  name                = "log-analytics"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "PerGB2018"
}