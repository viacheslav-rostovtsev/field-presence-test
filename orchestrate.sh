#!/bin/bash
echo "We need sudo to clear up /tmp/ruby-protoc-latest because of how docker-in-docker treats files"
sudo rm -rf /tmp/ruby-protoc-latest

./protoc-latest.sh
./ruby-protoc-latest.sh
./ruby-run-latest.sh
