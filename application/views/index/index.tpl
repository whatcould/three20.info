<h1>Here, there be dragons</h1>

<p>The three20 library is a foreign beast to many. With its largely undocumented code set and
  sparse examples, it can really seem like taming the wild Kraken at times.</p>

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
