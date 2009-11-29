<?php

class TutorialsController extends Three20Controller {

  const GITHUB_TITLE = 'How to build a GitHub iPhone app with three20';

  public function githubintro() {
    $this->view->prependTitle(self::GITHUB_TITLE);
    $this->view->prependTitle('Intro');
    $this->view->addMeta(array(
      'name'    => 'description',
      'content' => 'How to build a GitHub iPhone app with three20'
    ));
  }

  public function githubpage2() {
    $this->view->prependTitle(self::GITHUB_TITLE);
    $this->view->prependTitle('The Model');
    $this->view->addMeta(array(
      'name'    => 'description',
      'content' => 'How to build a GitHub iPhone app with three20, page 2'
    ));
    $this->view->addJsHeadFile('/js/shBrushXml.js');
  }

}
