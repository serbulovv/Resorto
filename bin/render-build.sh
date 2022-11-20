#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
yarn install
bundle exec rake db:prepare
bundle exec rake log:clear tmp:clear
bundle exec rake restart
