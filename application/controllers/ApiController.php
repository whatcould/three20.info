<?php

class ApiController extends Three20Controller {

  public function setup() {
    parent::setup();

    $this->view->addJsFootFile('/js/apilookup.js');
  }

  public function ttlauncherview() {
    $this->view->prependTitle('TTLauncherView');
  }

  public function ttnavigator() {
    $this->view->prependTitle('TTNavigator');
  }

  public function tturlmap() {
    $this->view->prependTitle('TTURLMap');
  }

  public function ttviewcontroller() {
    $this->view->prependTitle('TTViewController');
  }

  public function ttwebcontroller() {
    $this->view->prependTitle('TTWebController');
  }

}
