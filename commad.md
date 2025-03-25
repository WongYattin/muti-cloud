連接到您的 AKS 叢集
```bash
az login
az aks get-credentials --resource-group ResourceGroup --name AKSCluster

az aks command invoke --resource-group ResourceGroup --name AKSCluster --command "kubectl apply -f - <<EOF
$(cat pgvector-statefulSet.yaml)
EOF"
```
