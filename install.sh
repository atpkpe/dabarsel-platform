#!/bin/bash

if [ ! -d "htdocs/sites/all/translations" ]; then
  mkdir "htdocs/sites/all/translations"
fi

if pushd "htdocs/sites/default" > /dev/null; then
  # Install site.
  drush sql-drop -y
  drush site-install atp --site-name="atp" -y --account-name=adaptadmin --account-pass=1a32b3635e28dc5c43d6
  drush vset cron_key "cron-b4d0fb22d1240c65749f"
  
  # Import language(s).
  if [ -n $(drush pml --type=module --pipe --no-core --status=enabled | grep l10n_update) ]
    then
      drush l10n-update-refresh
      drush l10n-update 
      drush @atp language-import da profiles/atp/translations/default-da.po --group=default
    else
      echo "l10n_update could not be found. Please activate it."
    fi

  # Run development setup tasks.
  echo "Devifying..."
  popd > /dev/null && ./devify.sh
fi
