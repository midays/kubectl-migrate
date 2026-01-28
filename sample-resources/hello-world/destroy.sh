#!/bin/bash

echo "# Using kubectl context: $(kubectl config current-context)"

kubectl delete -f manifest.yaml
