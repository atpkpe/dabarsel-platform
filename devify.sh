#!/bin/bash

if pushd "htdocs/sites/default" > /dev/null; then
  drush cc all
  drush en -y atp_dev
  drush atp-set-frontpage
  drush vset date_default_timezone 'Europe/Copenhagen'
fi
