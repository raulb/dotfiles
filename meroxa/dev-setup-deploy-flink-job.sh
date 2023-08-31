#!/usr/bin/env bash

cd ~/code/meroxa/cli
make install
eval $(meroxa-dev env dev)
$(go env GOPATH)/bin/meroxa login

# echo "$(go env GOPATH)/bin/meroxa resources create pg --type postgres --url $(pbpaste)"
