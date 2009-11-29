<?php

class IndexController extends Three20Controller {

  public function index() {
    $this->view->prependTitle('Home');
    $this->view->hideModificationDate = true;
    $this->view->hideDisqusThread = true;

    $this->view->addMeta(array(
      'name'    => 'description',
      'content' => 'API documentation, articles, and tutorials related to the three20 iPhone library.'
    ));

    $this->view->addCssFile('/css/main.css');
  }

}
