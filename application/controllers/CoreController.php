<?php

class CoreController extends Three20Controller {

  public function debugging() {
    $this->view->prependTitle('Debugging with three20');
  }

}
