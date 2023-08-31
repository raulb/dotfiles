#!/usr/bin/env bash

cd ~/code/meroxa/flink-examples/flink-meroxa
$(go env GOPATH)/bin/meroxa jobs deploy my-first-flink-job --jar ./target/meroxa-flink-pipeline-0.1.0-SNAPSHOT.jar
