<?php

class ApiController extends Three20Controller {

  public function setup() {
    parent::setup();

    $this->view->addCssFile('/css/jquery.autocomplete.css');
    $this->view->addJsFootFile('/js/jquery.js');
    $this->view->addJsFootFile('/js/jquery.autocomplete.js');
    $this->view->addJsFootFile('/js/apilookup.js');
  }

  public function ttnavigator() {
    $this->view->prependTitle('TTNavigator');
  }

}
