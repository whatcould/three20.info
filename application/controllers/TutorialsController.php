<?php

class TutorialsController extends Three20Controller {

  public function githubintro() {
    $this->view->prependTitle('How to build a GitHub iPhone app with three20');
    $this->view->addMeta(array(
      'name'    => 'description',
      'content' => 'How to build a GitHub iPhone app with three20'
    ));
  }

}
