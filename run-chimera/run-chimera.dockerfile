FROM ruby:2.6-stretch as builder
COPY run-chimera.entrypoint.sh .
RUN gem install bundler
WORKDIR /ruby-proto3-chimera

ENTRYPOINT /run-chimera.entrypoint.sh; /bin/bash
