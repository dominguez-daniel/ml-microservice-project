#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=ddanny99/udacity-ml-project

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacity-ml-project --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
kubectl get deploy,rs,svc,pods

sleep 40

# Step 4:
# Forward the container port to a host
kubectl port-forward udacity-ml-project 8000:80
