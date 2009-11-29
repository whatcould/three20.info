<?php

class ApiController extends Three20Controller {

  public function setup() {
    parent::setup();

    $this->view->addJsFootFile('/js/apilookup.js');
    $this->view->addMeta(array(
      'name'    => 'description',
      'content' => 'The Three20 library API documents'
    ));
  }

  public function additions() {
    $this->view->prependTitle('Additions');
  }

  public function globalmethods() {
    $this->view->prependTitle('Global Methods');
  }

  public function ttactionsheetcontroller() {
    $this->view->prependTitle('TTActionSheetController');
  }

  public function ttalertviewcontroller() {
    $this->view->prependTitle('TTAlertViewController');
  }

  public function ttimageview() {
    $this->view->prependTitle('TTImageView');
  }

  public function ttlauncherview() {
    $this->view->prependTitle('TTLauncherView');
  }

  public function ttmessagecontroller() {
    $this->view->prependTitle('TTMessageController');
  }

  public function ttmodel() {
    $this->view->prependTitle('TTModel');
  }

  public function ttmodelviewcontroller() {
    $this->view->prependTitle('TTModelViewController');
  }

  public function ttnavigator() {
    $this->view->prependTitle('TTNavigator');
  }

  public function ttpostcontroller() {
    $this->view->prependTitle('TTPostController');
  }

  public function ttpopupviewcontroller() {
    $this->view->prependTitle('TTPopupViewController');
  }

  public function ttscrollview() {
    $this->view->prependTitle('TTScrollView');
  }

  public function ttshape() {
    $this->view->prependTitle('TTShape');
  }

  public function ttstyle() {
    $this->view->prependTitle('TTStyle');
  }

  public function ttstylesheet() {
    $this->view->prependTitle('TTStyleSheet');
  }

  public function tturlmap() {
    $this->view->prependTitle('TTURLMap');
  }

  public function tturlrequestmodel() {
    $this->view->prependTitle('TTURLRequestModel');
  }

  public function ttview() {
    $this->view->prependTitle('TTView');
  }

  public function ttviewcontroller() {
    $this->view->prependTitle('TTViewController');
  }

  public function ttyoutubeview() {
    $this->view->prependTitle('TTYouTubeView');
  }

  public function ttwebcontroller() {
    $this->view->prependTitle('TTWebController');
  }

}
