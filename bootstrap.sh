#!/bin/bash

# 1. Create the Kubernetes cluster using kind
kind create cluster --config cluster.yml

# 2. Create Namespaces first
kubectl apply -f .infrastructure/namespace.yml
kubectl apply -f .infrastructure/namespace-mysql.yml

# 3. Apply ConfigMaps and Secrets
kubectl apply -f .infrastructure/configMap.yml
kubectl apply -f .infrastructure/configMap-mysql.yml
kubectl apply -f .infrastructure/secret.yml
kubectl apply -f .infrastructure/mysql-secret.yml
kubectl apply -f .infrastructure/db-conn-secret.yml

# 4. Setup Storage (PV and PVC)
kubectl apply -f .infrastructure/pv.yml
kubectl apply -f .infrastructure/pvc.yml

# 5. Deploy MySQL Database (Service and StatefulSet)
kubectl apply -f .infrastructure/mysql-service.yml
kubectl apply -f .infrastructure/statefulSet.yml

# 6. Deploy the TodoApp and its Services
kubectl apply -f .infrastructure/deployment.yml
kubectl apply -f .infrastructure/clusterIp.yml
kubectl apply -f .infrastructure/nodeport.yml
kubectl apply -f .infrastructure/hpa.yml

echo "✅ All resources have been applied to the cluster."
echo "⏳ Please wait a few minutes for all pods to reach the 'Running' state."