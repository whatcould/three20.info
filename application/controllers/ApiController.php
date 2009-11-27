<?php

class ApiController extends Three20Controller {

  public function setup() {
    parent::setup();

    $this->view->addJsFootFile('/js/apilookup.js');
  }

  public function ttnavigator() {
    $this->view->prependTitle('TTNavigator');
  }

}
