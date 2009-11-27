<?php

class IssuesController extends Three20Controller {

  public function index() {
    $this->view->prependTitle('Issues');
    $this->view->addCssFile('/css/issues.css');
    $this->view->addJsFootFile('/js/github.js');
    $this->view->addJsFootFile('/js/showdown.js');
    $this->view->addJsFootFile('/js/issues.js');
  }

}
