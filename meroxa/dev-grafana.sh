#!/usr/bin/env bash

# Open grafana
kubectl config use-context meroxa-control-plane
kubectl get secret --namespace telemetry grafana -o jsonpath="{.data.admin-password}" | base64 --decode | pbcopy
open "$(minikube service --profile meroxa-control-plane --url -n telemetry grafana)"
