<?php

class IndexController extends Three20Controller {

  public function index() {
    $this->view->prependTitle('Home');
    $this->view->hideModificationDate = true;
    $this->view->hideDisqusThread = true;

    $this->view->addCssFile('/css/main.css');

    $this->view->addJsHeadFile('http://www.google.com/jsapi?key='.GFEEDS_API);
    $this->view->addJsFootFile('/js/jquery.js');
    $this->view->addJsFootFile('/js/date.format.js');
    $this->view->addJsFootFile('/js/github.js');
    $this->view->addJsFootFile('/js/main.js');
  }

}
