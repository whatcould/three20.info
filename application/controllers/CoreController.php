<?php

class CoreController extends Three20Controller {

  public function setup() {
    parent::setup();

    $this->view->addMeta(array(
      'name'    => 'description',
      'content' => 'Articles about three20, an open source library for the iPhone'
    ));
  }

  public function debugging() {
    $this->view->prependTitle('Debugging with three20');
  }

  public function navigation() {
    $this->view->prependTitle('URL-Based Navigation');
  }

}
