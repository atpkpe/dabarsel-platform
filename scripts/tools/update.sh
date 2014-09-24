#!/bin/sh

# Set environment
THIS=$(readlink -f $0)
THIS_DIR=`dirname $THIS`
DRUPAL_ROOT=$THIS_DIR/../../site/htdocs

# Run drush cmds
drush --root=$DRUPAL_ROOT updb -y
drush --root=$DRUPAL_ROOT fra -y
drush --root=$DRUPAL_ROOT cc all
