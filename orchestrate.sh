#!/bin/bash
echo "Preparing folders"
mkdir -p /tmp/ruby-protoc-latest
rm -rf /tmp/ruby-protoc-latest
mkdir -p /tmp/ruby-protoc-latest/src/field_presence_opt
mkdir -p /tmp/ruby-protoc-latest/src/field_presence

echo "Copying protos"
cp ./protos/field_presence_opt.proto /tmp/ruby-protoc-latest/src/field_presence_opt/field_presence.proto
cp ./protos/field_presence_noopt.proto /tmp/ruby-protoc-latest/src/field_presence/field_presence.proto

echo "Cloning api-common-protos"
pushd /tmp/ruby-protoc-latest/src/
git clone https://github.com/googleapis/api-common-protos
popd

echo "Building latest protoc"
(cd build-protoc-latest && ./build-protoc-latest.sh)

echo "Running protoc generation"
(cd protoc-generate && ./protoc-generate.sh)

echo "Running gapic generation"
(cd gapic-generate && ./gapic-generate.sh)

echo "Mixing chimera and running"
(cd run-chimera && ./run-chimera.sh)
