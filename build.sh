#!/bin/bash
drush situs-build --root=htdocs --make-file=./platform.make --git-check --git-check-ignore-regex=/global/,/contrib/,/libraries/

cat patches/atp-admin.css >> htdocs/profiles/atp/themes/contrib/adminimal_theme/css/style.css
