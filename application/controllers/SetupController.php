<?php

class SetupController extends Three20Controller {

  public function existing() {
    $this->view->prependTitle('Add three20 to your Project');
  }

  public function templates() {
    $this->view->prependTitle('Three20 Project Templates');
  }

}
