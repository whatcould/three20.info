<?php

class IndexController extends Three20Controller {

  public function index() {
    $this->view->prependTitle('Home');
    $this->view->hideModificationDate = true;
    $this->view->hideDisqusThread = true;
  }

}
