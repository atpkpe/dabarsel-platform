#!/bin/bash

if pushd "htdocs/sites/default" > /dev/null; then
  drush en -y atp_dev
fi
