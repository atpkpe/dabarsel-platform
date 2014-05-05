<?php

/**
 * @file
 * Default drush aliases.drushrc.php file.
 */

/**
 * These are the default configuration so that
 * everyone can just overwrite the different settings.
 */

$aliases['loc'] = array(
  'uri' => 'loc.atp.dk',
  'root' => '/vagrant_sites/loc.atp.dk/htdocs',
  'remote-host' => 'default',
);

$aliases['stage'] = array(
  'uri' => 'atp.fe.test.cd.adapt.dk',
  'root' => '/home/drupal/atp.stage/site/htdocs',
  'remote-host' => '0',
);

$aliases['live'] = array(
  'uri' => 'atp.dk',
  'root' => '/home/drupal/atp.live/site/htdocs',
  'remote-host' => '0',
);
