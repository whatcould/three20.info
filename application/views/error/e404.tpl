404
===

Seems you've lost your way. You can try finding your way with the links to the left, or you can
type the name of any three20 class up there ^.

<?php

$this->hideModificationDate = true;
$this->hideDisqusThread = true;
$this->appendTitle('three20.info');
$this->appendTitle('three20.info');
$this->addCssFile('/css/global.css');
$this->addCssFile('/css/shCore.css');
$this->addCssFile('/css/shTheme.css');
$this->addCssFile('/css/jquery.autocomplete.css');

$this->addJsFootFile('/js/jquery.js');
$this->addJsFootFile('/js/jquery.placeholder.js');
$this->addJsFootFile('/js/jquery.autocomplete.js');
$this->addJsFootFile('/js/globallookup.js');
$this->addJsHeadFile('/js/shCore.js');
$this->addJsHeadFile('/js/shBrushObjC.js');
$this->addJsHeadFile('/js/shBrushBash.js');
$this->addJsHeadScript('
  SyntaxHighlighter.config.clipboardSwf = \'/swf/clipboard.swf\';
  SyntaxHighlighter.defaults.light = true;
  SyntaxHighlighter.defaults[\'tab-size\'] = 2;
  SyntaxHighlighter.defaults[\'auto-links\'] = false;
  SyntaxHighlighter.defaults.toolbar = false;
  SyntaxHighlighter.all();');
?>