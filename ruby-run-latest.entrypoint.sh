#!/bin/bash

cp -r /src/* /workspace/
bundle install
bundle exec rake test
