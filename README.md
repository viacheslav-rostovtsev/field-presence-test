# Testing the proto3_optional with gapic-generator-ruby  
  
## TLDR  
run orchestrate.sh, give it sudo to clean up /tmp/ruby-protoc-latest and prepare to wait forever for protoc to build (consecutive runs will be much faster)  
 
## Some explanations  
### orchestrate.sh
runs the rest of these in order; also since Ruby-protoc-latest uses docker-in-docker it'll mess up the permissions inside its temp folder so orchestrate.sh asks for sudo to clean that up

### Protos  
field_presence_noopt.proto -- a proto with a testing service  
field_presence_opt.proto -- same service but some fields are marked optional  

### Protoc-latest  
protoc-latest.dockerfile -- dockerfile to download and build the latest protoc from master  
protoc-latest.sh -- run this to build and run the protoc-latest.dockerfile

### Ruby-protoc-latest
ruby-protoc-latest.dockerfile -- dockerfile derived from the protoc-latest. Builds the field_presence_opt.proto with the latest protoc then builds the field_presence_noopt.proto with the gapic-generator-ruby then mixes the results  
ruby-protoc-latest-entrypoint.sh -- entrypoint within the container  
ruby-protoc-latest.sh -- run this to build and run the ruby-protoc-latest.dockerfile  
  
### Ruby-run-latest  
ruby-run-latest.dockerfile -- dockerfile with ruby in it. Runs tests on the chimera created by the Ruby-protoc-latest
ruby-run-latest.entrypoint.sh -- entrypoint within the container
ruby-run-latest.sh -- run this to build and run the ruby-run-latest.dockerfile 
