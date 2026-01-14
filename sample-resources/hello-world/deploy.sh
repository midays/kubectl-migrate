#!/bin/bash

kubectl create -f manifest.yaml

echo "Waiting for deployment to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment/apache-hello
