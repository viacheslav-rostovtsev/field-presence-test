# Testing the proto3_optional with gapic-generator-ruby  
  
## TLDR  
run orchestrate.sh and prepare to wait forever for protoc to build (consecutive runs will be much faster)  
 
## Some explanations  
### orchestrate.sh
runs the rest of these in order

### Protos in /protos
field_presence_noopt.proto -- a proto with a testing service  
field_presence_opt.proto -- same service but some fields are marked optional  

### Build-protoc-latest in /build-protoc-latest
build-protoc-latest.sh -- run this to build and run the protoc-latest.dockerfile
build-protoc-latest.dockerfile -- dockerfile to download and build the latest protoc from master  

### Gapic-generate in /gapic-generate
gapic-generate.sh -- runs stock gapic generator to generate client for the field_presence_noopt.proto

### Ruby-protoc-latest
ruby-protoc-latest.sh -- run this to build and run the ruby-protoc-latest.dockerfile
ruby-protoc-latest.dockerfile -- dockerfile derived from the protoc-latest. Runs the latest protoc to generate bindings for the field_presence_opt.proto
ruby-protoc-latest-entrypoint.sh -- entrypoint within the container  

  
### Ruby-run-latest  
ruby-run-latest.sh -- overlays the results of Gapic-generate Ruby-protoc-latest to create the chimera and runs the ruby-run-latest.dockerfile 
ruby-run-latest.dockerfile -- dockerfile with ruby in it. Runs tests on the chimera
ruby-run-latest.entrypoint.sh -- entrypoint within the container
