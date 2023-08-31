#!/usr/bin/env bash

AWS_ACCESS_KEY_ID="$1"
AWS_SECRET_ACCESS_KEY="$2"

if [ $# -lt 2 ]; then
    echo "Usage: $0 <AWS_ACCESS_KEY_ID> <AWS_ACCESS_KEY_ID>"
    exit 1
fi

kubectl config use-context meroxa-control-plane
kubectl set env deployments/meroxa-api DATA_PLANE_ID="1903" -n meroxa-api
kubectl set env deployments/meroxa-api DATA_PLANE_AWS_REGION="us-east-1" -n meroxa-api
kubectl set env deployments/meroxa-api DATA_PLANE_AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" -n meroxa-api
kubectl set env deployments/meroxa-api DATA_PLANE_AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" -n meroxa-api
