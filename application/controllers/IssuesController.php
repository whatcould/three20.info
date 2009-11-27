<?php

class IssuesController extends Three20Controller {

  public function index() {
    $this->view->prependTitle('Issues');
    $this->view->meta .= '<meta name="description" content="Submit an issue to the three20 library." />';

    $this->view->addCssFile('/css/issues.css');
    $this->view->addJsFootFile('/js/github.js');
    $this->view->addJsFootFile('/js/showdown.js');
    $this->view->addJsFootFile('/js/issues.js');
  }

}
