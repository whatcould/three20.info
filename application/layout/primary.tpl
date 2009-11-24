<?= $this->doctype() ?>
<html<?= $this->xmlns() ?>>
<head>
  <?= $this->meta() ?>
  <?= $this->pageTitle() ?>
  <?= $this->css() ?>
  <?= $this->jsHead() ?>
</head>
<body>
<div id="page">
<div id="pageheader">
  <div class="fixedwidth">
    <div class="title">three20<span class="subtitle">.info</span></div>
  </div>
</div>
<div id="pageheadershadow"></div>

<div class="fixedwidth">
<div id="toc">
  <div class="header">Core Reference</div>
  <ul>
    <li><a href="/core/debugging">Debugging</a></li>
    <li><a href="/core/navigation">Navigation</a></li>
  </ul>
  <div class="header">Core Reference</div>
  <ul>
    <li><a href="/core/debugging">Debugging</a></li>
    <li><a href="/core/navigation">Navigation</a></li>
  </ul>
</div>

<div id="content">
<?= $this->content() ?>
</div>

<div class="clearfix"></div>

</div> <!-- fixedwidth -->

</div> <!-- page -->
<?= $this->jsFoot() ?>
</body>
</html>
