#!/bin/bash

docker build -t ruby-run-latest -f ./ruby-run-latest.dockerfile . && \
docker run \
--mount type=bind,source="/tmp/ruby-protoc-latest/src/ruby-field-presence",target='/src' \
-it --rm \
ruby-run-latest
