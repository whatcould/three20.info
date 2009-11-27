<?php

class ApiController extends Three20Controller {

  public function setup() {
    parent::setup();

    $this->view->addJsFootFile('/js/apilookup.js');
  }

  public function ttlauncherview() {
    $this->view->prependTitle('TTLauncherView');
  }

  public function ttmessagecontroller() {
    $this->view->prependTitle('TTMessageController');
  }

  public function ttmodel() {
    $this->view->prependTitle('TTModel');
  }

  public function ttmodelviewcontroller() {
    $this->view->prependTitle('TTModelViewController');
  }

  public function ttnavigator() {
    $this->view->prependTitle('TTNavigator');
  }

  public function ttstylesheet() {
    $this->view->prependTitle('TTStyleSheet');
  }

  public function tturlmap() {
    $this->view->prependTitle('TTURLMap');
  }

  public function tturlrequestmodel() {
    $this->view->prependTitle('TTURLRequestModel');
  }

  public function ttviewcontroller() {
    $this->view->prependTitle('TTViewController');
  }

  public function ttwebcontroller() {
    $this->view->prependTitle('TTWebController');
  }

}
