#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID
dockerpath=namnd00/ml-microservice-k8s:latest

# Step 2
# Run a Docker Hub container with kubernetes
kubectl run ml-microservice \
    --namespace=default \
    --image=$dockerpath \
    --port=80 --labels app=ml-microservice

# Step 3:
# List kubernetes pods
kubectl get pods
kubectl wait pods -n default -l app=ml-microservice --for condition=Ready --timeout=120s

# Step 4:
# Forward the container port to host
kubectl port-forward ml-microservice 8000:80