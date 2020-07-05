#!/bin/sh
set -e

cd example-api
rake db:migrations
rake db:seeds
rackup -p 8080 --host 0.0.0.0
