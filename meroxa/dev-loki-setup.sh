#!/usr/bin/env bash

output=$(minikube service --profile meroxa-control-plane --url -n meroxa-nginx meroxa-nginx-ingress-nginx-controller)
read -ra urls <<< "$output"

ip=$(echo "$urls" | awk -F'[/:]' '{print $4}')
port=$(echo "$urls" | awk -F'[/:]' '{print $5}')

content=$(echo "loki:
   port: $port
   ip: $ip
")


file_path="/Users/rb/code/meroxa/platform-dev-setup/data-plane-addons/values.yaml"

# Write the new content to the file, overwriting existing content
echo "$content" > "$file_path"

cd /Users/rb/code/meroxa/platform-dev-setup/ 
make install_data_plane_addon
