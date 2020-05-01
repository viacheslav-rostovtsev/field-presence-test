#!/bin/bash
echo "Building the latest protoc"
docker build -t protoc-latest -f ./protoc-latest.dockerfile . && \
