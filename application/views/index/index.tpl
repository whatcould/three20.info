<h1>Here, there be dragons</h1>

<p>The three20 library is a beast to tackle for many. While there are examples and documentation
  does somewhat exist, there are a number of powerful features of the library that go unnoticed.</p>

<p>That's why three20.info was created. You'll find tutorials, documentation, and the latest
  updates related to three20 and iPhone development in general. Whether you've recently stumbled
  across three20 or you're a seasoned TT* vet, here's to you learning a thing or two while you're
  here.</p>

<div id="widgets">
  <div class="widget" id="github">
    <div class="header">Latest Commits</div>
    <div class="content">
      <div class="loading">Loading github status...</div>
      <div class="commits"></div>
    </div>
  </div>

  <div class="widget" id="newsgroup">
    <div class="header">Newsgroup</div>
    <div class="content">
      <div class="loading">Loading newsgroup...</div>
      <div class="posts"></div>
    </div>
  </div>
</div>

<div class="clearfix"></div>

<?php

$this->addCssFile('/css/main.css');

$this->addJsHeadFile('http://www.google.com/jsapi?key='.GFEEDS_API);
$this->addJsFootFile('/js/jquery.js');
$this->addJsFootFile('/js/date.format.js');
$this->addJsFootFile('/js/github.js');
$this->addJsFootFile('/js/main.js');
