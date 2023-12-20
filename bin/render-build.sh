#!/usr/bin/env bash
# exit on error
set -o errexit

bundle lock --add-platform x86_64-linux
bundle exec rake app:update:bin
bundle install
./bin/rails assets:precompile
./bin/rails rake assets:clean