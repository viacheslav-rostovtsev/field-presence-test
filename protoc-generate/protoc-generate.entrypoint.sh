#!/bin/bash
protoc -I $(pwd)/field_presence_opt -I $(pwd)/api-common-protos field_presence.proto --ruby_out=./protoc-ruby-out/ --experimental_allow_proto3_optional
