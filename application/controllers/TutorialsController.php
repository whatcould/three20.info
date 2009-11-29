<?php

class TutorialsController extends Three20Controller {

  const GITHUB_TITLE = 'How to build a GitHub iPhone app with three20';

  public function githubintro() {
    $this->view->prependTitle(self::GITHUB_TITLE);
    $this->view->prependTitle('Intro');
    $this->view->addMeta(array(
      'name'    => 'description',
      'content' => self::GITHUB_TITLE.': introduction'
    ));
  }

  public function githubpage2() {
    $this->view->prependTitle(self::GITHUB_TITLE);
    $this->view->prependTitle('The User Model');
    $this->view->addMeta(array(
      'name'    => 'description',
      'content' => self::GITHUB_TITLE.': creating the user model'
    ));
    $this->view->addJsHeadFile('/js/shBrushXml.js');
  }

  public function githubpage3() {
    $this->view->prependTitle(self::GITHUB_TITLE);
    $this->view->prependTitle('The User View');
    $this->view->addMeta(array(
      'name'    => 'description',
      'content' => self::GITHUB_TITLE.': drawing the user view'
    ));
  }

}
