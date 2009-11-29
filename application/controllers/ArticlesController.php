<?php

class ArticlesController extends Three20Controller {

  public function index() {
    $this->view->prependTitle('Articles');
    $this->view->addMeta(array(
      'name'    => 'description',
      'content' => 'Three20 is an open source library for the iPhone'
    ));
  }

}
