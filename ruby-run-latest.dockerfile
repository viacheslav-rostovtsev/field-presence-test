FROM ruby:2.6-stretch as builder
COPY ruby-run-latest.entrypoint.sh .
RUN gem install bundler
WORKDIR /workspace

ENTRYPOINT /ruby-run-latest.entrypoint.sh
