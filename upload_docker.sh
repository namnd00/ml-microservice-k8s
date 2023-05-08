#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
 dockerpath=namnd00/ml-microservice-k8s:latest

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login
docker tag ml-microservice-k8s:latest $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath