#!/bin/sh

# Set environment
THIS=$(readlink -f $0)
THIS_DIR=`dirname $THIS`
DRUPAL_ROOT=$THIS_DIR/../../htdocs
DRUSH=/usr/local/bin/drush
# Run drush cmds
$DRUSH --root=$DRUPAL_ROOT updb -y
$DRUSH --root=$DRUPAL_ROOT fra -y
$DRUSH --root=$DRUPAL_ROOT cc all
