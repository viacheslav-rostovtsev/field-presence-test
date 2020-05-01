#!/bin/bash
protoc -I $(pwd)/field_presence_opt -I $(pwd)/api-common-protos field_presence.proto --ruby_out=./protoc-ruby-out/ --experimental_allow_proto3_optional

docker run --user $UID --rm \
  --mount type=bind,source=/tmp/ruby-protoc-latest/src/field_presence,destination=/in/,readonly \
  --mount type=bind,source=/tmp/ruby-protoc-latest/src/ruby-field-presence,destination=/out \
  gcr.io/gapic-images/gapic-generator-ruby:latest --ruby-cloud-gem-name=so-much-trash

cp ./protoc-ruby-out/* ruby-field-presence/lib
