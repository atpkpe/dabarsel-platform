#!/bin/bash
mysql -uroot -proot -h 127.0.0.1 -e "create database dabarsel_local"

if pushd "htdocs/sites/default" > /dev/null; then
  ln -sf ../../../settings/local.settings.php settings.php
  mkdir files
  chmod 775 files
fi
