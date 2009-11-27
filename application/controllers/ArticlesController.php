<?php

class ArticlesController extends Three20Controller {

  public function index() {
    $this->view->prependTitle('Articles');
  }

}
