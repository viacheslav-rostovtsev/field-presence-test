#!/bin/bash
mkdir -p /tmp/ruby-protoc-latest/src/gapic-ruby-out

docker run --user $UID --rm \
  --mount type=bind,source=/tmp/ruby-protoc-latest/src/field_presence,destination=/in/,readonly \
  --mount type=bind,source=/tmp/ruby-protoc-latest/src/gapic-ruby-out,destination=/out \
  gcr.io/gapic-images/gapic-generator-ruby:latest --ruby-cloud-gem-name=so-much-trash