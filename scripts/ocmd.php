<?php

if( $argc < 2 ) {
  echo 'Missing file parameter';
  exit;
}

$filename = $argv[1];

$contents = file_get_contents($filename);

$lines = explode("\n", $contents);

$in_comment = false;
$comment_buffer = null;

$in_property = false;
$property_buffer = null;

$in_method = false;
$method_buffer = null;

echo '<?= $this->pageTitle() ?>
=========================

Know what you\'re looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Properties](#properties)
* [Methods](#methods)
</div>
<div class="clearfix"></div>

Properties {#properties}
==========

Methods {#methods}
=======

';

foreach( $lines as $line ) {
  if( substr($line, 0, 3) == '/**' ) {
    $in_comment = true;
    $comment_buffer = '';

  } else if( $in_comment ) {
    if( substr($line, 0, 3) == ' * ' ) {
      $comment_buffer .= substr($line, 3)."\n";
    }

    if( substr($line, 0, 3) == ' */' ) {
      $in_comment = false;
    }
  }

  if( substr($line, 0, 1) == '-' ||
      substr($line, 0, 1) == '+' ||
      substr($line, 0, 4) == 'BOOL' ||
      substr($line, 0, 4) == 'void' ||
      substr($line, 0, 4) == 'float' ||
      substr($line, 0, 2) == 'NS' ||
      substr($line, 0, 2) == 'UI' ||
      substr($line, 0, 2) == 'CG' ) {
    $in_method = true;
    $method_buffer = '';
  }

  if( $in_method ) {
    $method_buffer .= $line."\n";
  }

  if( $in_method && strpos($line, ';') !== false ) {
    $in_method = false;
    $method_name = str_replace("\n", '', $method_buffer);

    // Remove "- (return_type)"
    $method_name = preg_replace('/[-+] \([a-z_*<>]+\)/i', '', $method_name);

    // Remove "return_type "
    $method_name = preg_replace('/^[\w*]+ /i', '', $method_name);
    
    $method_name = preg_replace('/:\([a-z_*<>]+\)\w+ /i', ':', $method_name);
    $method_name = preg_replace('/:\([a-z_*<>]+\)\w+;/i', ':', $method_name);
    // Remove "(void*)"
    $method_name = preg_replace('/\([a-z* ,]*\)/i', '', $method_name);
    $method_name = preg_replace('/^[-+]/i', '', $method_name);
    $method_name = preg_replace('/;/i', '', $method_name);
    $method_name = preg_replace('/\s/', '', $method_name);
    echo '### '.$method_name.' {#'.$method_name.'}'."\n\n";
    echo '."brush: obj-c"'."\n";
    $method_lines = explode("\n", $method_buffer);
    foreach( $method_lines as $method_line ) {
      echo '    '.$method_line."\n";
    }
    if( trim(str_replace('\n', '', $comment_buffer)) ) {
      echo $comment_buffer."\n";
    } else {
      echo "Undocumented.\n\n";
    }
  }

  if( substr($line, 0, 1) == '@' &&
      strpos($line, '@protocol') === false &&
      strpos($line, '@implementation') === false &&
      strpos($line, '@class') === false &&
      strpos($line, '@interface') === false &&
      !in_array($line, array(
        '@end',
        '@optional',
        '@required')) ) {
    $in_property = true;
    $property_buffer = '';
  } else if( substr($line, 0, 1) == '@' &&
             (strpos($line, '@protocol') !== false ||
              strpos($line, '@implementation') !== false ||
              strpos($line, '@class') !== false ||
              strpos($line, '@interface') !== false) ) {
    $comment_buffer = null;
  }

  if( $in_property ) {
    $property_buffer .= $line."\n";
  }

  if( $in_property && strpos($line, ';') !== false ) {
    $in_property = false;
    $property_name = trim(trim(substr($property_buffer, strrpos($property_buffer, ' '))), ';');
    echo '### '.$property_name.' {#'.$property_name.'}'."\n\n";
    echo '."brush: obj-c"'."\n";
    $property_lines = explode("\n", $property_buffer);
    foreach( $property_lines as $property_line ) {
      echo '    '.preg_replace('/,(\w)/i', ', \\1',
                  str_replace('@property(', '@property (', $property_line))."\n";
    }
    if( trim(str_replace('\n', '', $comment_buffer)) ) {
      echo $comment_buffer."\n";
    } else {
      echo "Undocumented.\n\n";
    }
  }
}
