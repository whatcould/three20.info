<?php

class ArticlesController extends Three20Controller {

  public function index() {
    $this->view->prependTitle('Articles');
    $this->view->meta .= '<meta name="description" content="Three20 is an open source library for the iPhone" />';
  }

}
