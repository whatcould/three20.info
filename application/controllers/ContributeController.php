<?php

class ContributeController extends Three20Controller {

  public function index() {
    $this->view->prependTitle('Contribute');
    $this->view->addMeta(array(
      'name'    => 'description',
      'content' => 'Contribute to three20, an open source library for the iPhone'
    ));
  }

}
