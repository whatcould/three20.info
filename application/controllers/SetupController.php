<?php

class SetupController extends Three20Controller {

  public function setup() {
    parent::setup();

    $this->view->meta .= '<meta name="description" content="Articles about three20, an open source library for the iPhone" />';
  }

  public function existing() {
    $this->view->prependTitle('Add three20 to your Project');
  }

  public function templates() {
    $this->view->prependTitle('Three20 Project Templates');
  }

}
