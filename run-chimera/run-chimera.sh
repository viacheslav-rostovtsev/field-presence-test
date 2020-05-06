#!/bin/bash
mkdir -p /tmp/ruby-protoc-latest/src/ruby-proto3-chimera

echo "Copying gapic and protoc outputs and overlaying them into chimera"
pushd /tmp/ruby-protoc-latest/src
cp -r ./gapic-ruby-out/* ./ruby-proto3-chimera/
cp ./protoc-ruby-out/* ./ruby-proto3-chimera/lib/
popd

echo "Adding a dependency on a release candidate of google-protobuf"
pushd /tmp/ruby-protoc-latest/src/ruby-proto3-chimera
sed -i '/google-cloud-errors/ a \ \ gem.add_dependency "google-protobuf", "~>3.12.0.rc.1"' so-much-trash.gemspec
popd

docker build -t ruby-proto3-chimera -f ./run-chimera.dockerfile .

docker run -it --rm \
--mount type=bind,source="/tmp/ruby-protoc-latest/src/ruby-proto3-chimera",target='/ruby-proto3-chimera' \
ruby-proto3-chimera
