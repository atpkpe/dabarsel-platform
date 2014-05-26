#!/bin/bash

if pushd "htdocs/sites/default" > /dev/null; then
  drush sql-drop -y
  drush site-install atp --site-name="atp" -y --account-name=adaptadmin --account-pass=1a32b3635e28dc5c43d6
  drush vset cron_key "cron-b4d0fb22d1240c65749f"
fi
# Run development setup tasks.
./devify.sh