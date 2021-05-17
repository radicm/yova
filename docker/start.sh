#!/bin/bash

until rails db:create db:migrate SKIP_CURRENCY_CHECK=true; do
  echo "Preparing database, retrying..."
  sleep 1
done

rails db:seed

rm -rf tmp/pids && rails server -b 0.0.0.0