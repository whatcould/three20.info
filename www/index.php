<?php

defined('APPLICATION_PATH') ||
  define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

defined('LIBRARY_PATH') ||
  define('LIBRARY_PATH', realpath(dirname(__FILE__).'/../library'));

defined('APPLICATION_ENV') ||
  define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ?
    getenv('APPLICATION_ENV') :
    'production'));

set_include_path(implode(PATH_SEPARATOR, array(
    realpath(LIBRARY_PATH),
    get_include_path(),
)));

include 'Keystone/Keystone.php';

$keystone = new Keystone();
$keystone->execute();
