#!/bin/bash

# Create Namespace
echo "--------------------Creating ArgoCD Namespace--------------------"
kubectl create ns argocd || true

# Deploy ArgoCD
echo "--------------------Deploying ArgoCD--------------------"
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for pods to start
echo "--------------------Waiting 1 minute for the pods to start--------------------"
sleep 1m

# Change Service to NodePort
echo "--------------------Changing ArgoCD Service to NodePort--------------------"
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'

# Display ArgoCD URL
echo "--------------------ArgoCD URL--------------------"
minikube service -n argocd argocd-server --url

# Display ArgoCD Password
echo "--------------------ArgoCD UI Password--------------------"
echo "Username: admin"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > argo-pass.txt
cat argo-pass.txt
