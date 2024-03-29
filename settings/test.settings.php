<?php

$databases = array();
$databases['default']['default'] = array(
  'driver' => 'mysql',
  'database' => 'dabarsel_test',
  'username' => 'root',
  'password' => 'root',
  'host' => 'localhost',
  'prefix' => '',
);

$conf['file_entity_allow_insecure_download'] = TRUE;

# SMTP server settings
$conf['smtp_on'] = '1';
$conf['smtp_allowhtml'] = '1';
$conf['smtp_library'] = 'profiles/atp/modules/contrib/smtp/smtp.module';
$conf['mail_system']['default-system'] = 'SmtpMailSystem';

# Make memcache the default memcache backend.
$conf['cache_backends'][] = 'profiles/atp/modules/contrib/memcache/memcache.inc';
$conf['cache_default_class'] = 'MemCacheDrupal';

# cache_form should always use a non-volatile caching engine.
$conf['cache_class_cache_form'] = 'DrupalDatabaseCache';

$conf['memcache_bins'] = array('cache' => 'default');

$conf['memcache_persistent'] = TRUE;
$conf['memcache_key_prefix'] = 'dabarseltest';
$conf['memcache_servers'] = array('localhost:11211' => 'default');

// Preproccesing of js/css
$conf['preprocess_css'] = 1;
$conf['preprocess_js'] = 1;

// Caching
$conf['block_cache'] = 1;
$conf['cache'] = 1;

// Error reporting
$conf['error_level'] = 0;

$update_free_access = FALSE;
$drupal_hash_salt = '';
# $base_url = 'http://www.example.com';  // NO trailing slash!
ini_set('session.gc_probability', 1);
ini_set('session.gc_divisor', 100);
ini_set('session.gc_maxlifetime', 200000);
ini_set('session.cookie_lifetime', 2000000);
# ini_set('pcre.backtrack_limit', 200000);
# ini_set('pcre.recursion_limit', 200000);
# $cookie_domain = '.example.com';
# $conf['site_name'] = 'My Drupal site';
# $conf['theme_default'] = 'garland';
# $conf['anonymous'] = 'Visitor';
# $conf['maintenance_theme'] = 'bartik';
# $conf['reverse_proxy'] = TRUE;
# $conf['reverse_proxy_addresses'] = array('a.b.c.d', ...);
# $conf['reverse_proxy_header'] = 'HTTP_X_CLUSTER_CLIENT_IP';
# $conf['omit_vary_cookie'] = TRUE;
# $conf['css_gzip_compression'] = FALSE;
# $conf['js_gzip_compression'] = FALSE;
# $conf['locale_custom_strings_en'][''] = array(
#   'forum'      => 'Discussion board',
#   '@count min' => '@count minutes',
# );
# $conf['blocked_ips'] = array(
#   'a.b.c.d',
# );
$conf['404_fast_paths_exclude'] = '/\/(?:styles)\//';
$conf['404_fast_paths'] = '/\.(?:txt|png|gif|jpe?g|css|js|ico|swf|flv|cgi|bat|pl|dll|exe|asp)$/i';
$conf['404_fast_html'] = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML+RDFa 1.0//EN" "http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><title>404 Not Found</title></head><body><h1>Not Found</h1><p>The requested URL "@path" was not found on this server.</p></body></html>';
# drupal_fast_404();
# $conf['proxy_server'] = '';
# $conf['proxy_port'] = 8080;
# $conf['proxy_username'] = '';
# $conf['proxy_password'] = '';
# $conf['proxy_user_agent'] = '';
# $conf['proxy_exceptions'] = array('127.0.0.1', 'localhost');
# $conf['allow_authorize_operations'] = FALSE;
