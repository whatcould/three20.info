<?php

class Three20Controller extends Keystone_Controller {

  public function setup() {
    $this->view->appendTitle('three20.info');
    $this->view->addCssFile('/css/global.css');
    date_default_timezone_set('America/Los_Angeles');
  }

}
