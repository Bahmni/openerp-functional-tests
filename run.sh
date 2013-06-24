#!/bin/sh
set -ex
rvm use ruby-1.9.3-p429
bundle install
bundle exec rspec spec/features/*.rb
