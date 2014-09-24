#!/bin/sh

# Set environment
THIS=$(readlink -f $0)
THIS_DIR=`dirname $THIS`
DRUPAL_ROOT=$THIS_DIR/../../site/htdocs
#alias drush="${THIS_DIR}/drush/drush --root=$DRUPAL_ROOT"
alias drush="drush --root=$DRUPAL_ROOT"

# Run drush cmds
drush updb -y
drush fra -y
drush cc all
