#!/bin/bash
mkdir -p /tmp/ruby-protoc-latest/src/protoc-ruby-out

docker build -t ruby-protoc-latest -f ./protoc-generate.dockerfile . && \

docker run --user $UID --rm \
--mount type=bind,source="/tmp/ruby-protoc-latest/src/",target='/src/' \
ruby-protoc-latest
