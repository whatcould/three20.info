<?php

class CoreController extends Three20Controller {

  public function debugging() {
    $this->view->prependTitle('Debugging with three20');
  }

  public function navigation() {
    $this->view->prependTitle('URL-Based Navigation');
  }

}
