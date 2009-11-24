<?= $this->doctype() ?>
<html<?= $this->xmlns() ?>>
<head>
  <?= $this->meta() ?>
  <?= $this->title() ?>
  <?= $this->css() ?>
  <?= $this->jsHead() ?>
</head>
<body>
<div id="page-wrapper">
<div id="page">
<div id="pageheader">
  <div class="fixedwidth">
    <div class="title"><a href="/">three20<span class="subtitle">.info</span></a></div>
  </div>
</div>
<div id="pageheadershadow"></div>

<? if( APPLICATION_ENV != 'development' ) { ?>
<div class="fixedwidth">
  <div style="text-align:center;font-size:5em;color:#999">Coming soon...</div></div>
<? } else { ?>
<div class="fixedwidth">
<div id="toc">
  <div class="header">Setup</div>
  <ul>
    <li><a href="/setup/existing">Add three20 to your project</a></li>
    <li><a href="/setup/templates">Three20 project templates</a></li>
  </ul>
  <div class="header">Core Reference</div>
  <ul>
    <li><a href="/core/debugging">Debugging with three20</a></li>
  </ul>
</div>

<div id="content">
<?= $this->content() ?>

<?php if( !isset($this->hideModificationDate) ) { ?>
<div class="lastmodified">Last modified: <?= date('l \t\h\e jS \of F Y h:i:s A', $this->templateModifiedTime); ?></div>
<?php } ?>

</div>

<div class="clearfix"></div>

<? } ?>

</div> <!-- fixedwidth -->

<div class="clearfix"></div>
<div id="page-footer"></div>
</div> <!-- page -->

</div> <!-- pagewrapper -->

<div id="footer">
  <div class="copyright">Copyright 2009 Licensed under the <a href="http://www.apache.org/licenses/LICENSE-2.0">Apache License</a>.</div>
  <div class="attribution">
    <a href="http://github.com/jverkoey/three20.info">Source hosted on github</a> -
    Made with the <a href="http://github.com/jverkoey/Keystone">Keystone</a> framework.
    </div>
</div>

<?= $this->jsFoot() ?>
</body>
</html>
