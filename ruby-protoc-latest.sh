#!/bin/bash

mkdir -p /tmp/ruby-protoc-latest
rm -rf /tmp/ruby-protoc-latest
mkdir -p /tmp/ruby-protoc-latest/src/field_presence_opt
mkdir -p /tmp/ruby-protoc-latest/src/field_presence
mkdir -p /tmp/ruby-protoc-latest/src/ruby-field-presence
mkdir -p /tmp/ruby-protoc-latest/src/protoc-ruby-out

cp ./field_presence_opt.proto /tmp/ruby-protoc-latest/src/field_presence_opt/field_presence.proto
cp ./field_presence_noopt.proto /tmp/ruby-protoc-latest/src/field_presence/field_presence.proto

pushd /tmp/ruby-protoc-latest/src/
git clone https://github.com/googleapis/api-common-protos
popd

docker build -t ruby-protoc-latest -f ./ruby-protoc-latest.dockerfile . && \
docker run \
-v /var/run/docker.sock:/var/run/docker.sock \
--mount type=bind,source="/tmp/ruby-protoc-latest/src/",target='/src/' \
-it --rm \
ruby-protoc-latest
