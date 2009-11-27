<?php

class Three20Controller extends Keystone_Controller {

  public function setup() {
    $this->view->meta = '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />'."\n".
      '  <meta name="keywords" content="three20 iPhone api open source library uikit tt" />'."\n  ";
    $this->view->appendTitle('three20.info');
    $this->view->addCssFile('/css/global.css');
    $this->view->addCssFile('/css/shCore.css');
    $this->view->addCssFile('/css/shTheme.css');
    $this->view->addCssFile('/css/jquery.autocomplete.css');

    $this->view->addJsFootFile('/js/jquery.js');
    $this->view->addJsFootFile('/js/jquery.placeholder.js');
    $this->view->addJsFootFile('/js/jquery.autocomplete.js');
    $this->view->addJsFootFile('/js/globallookup.js');
    $this->view->addJsHeadFile('/js/shCore.js');
    $this->view->addJsHeadFile('/js/shBrushObjC.js');
    $this->view->addJsHeadFile('/js/shBrushBash.js');
    $this->view->addJsHeadScript('
      SyntaxHighlighter.config.clipboardSwf = \'/swf/clipboard.swf\';
      SyntaxHighlighter.defaults.light = true;
      SyntaxHighlighter.defaults[\'tab-size\'] = 2;
      SyntaxHighlighter.defaults[\'auto-links\'] = false;
      SyntaxHighlighter.defaults.toolbar = false;
      SyntaxHighlighter.all();');
    date_default_timezone_set('America/Los_Angeles');
  }

}
