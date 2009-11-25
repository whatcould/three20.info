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
    <li><a href="/setup/existing">Add three20 to your Project</a></li>
    <li><a href="/setup/templates">Three20 Project Templates</a></li>
  </ul>
  <div class="header">Articles</div>
  <ul>
    <li><a href="/core/debugging">Debugging with three20</a></li>
    <li><a href="/core/navigation">URL-Based Navigation</a></li>
  </ul>
</div>

<div id="content">
<?= $this->content() ?>

<? if( !isset($this->hideModificationDate) && isset($this->templateModifiedTime) ) { ?>
<div class="lastmodified">Last modified: <?= date('l \t\h\e jS \of F Y h:i:s A', $this->templateModifiedTime); ?></div>
<? } ?>

<? if( !isset($this->hideDisqusThread) ) { ?>
<div id="disqus_thread"></div>
<noscript><a href="http://disqus.com/forums/three20/?url=ref">View the discussion thread.</a></noscript>
<? } ?>
</div>

<div class="clearfix"></div>

<? } ?>

</div> <!-- fixedwidth -->

<div class="clearfix"></div>
<div id="page-footer"></div>
</div> <!-- page -->

</div> <!-- pagewrapper -->

<div id="footer">
  <div class="copyright">Copyright 2009 All content licensed under the <a href="http://www.apache.org/licenses/LICENSE-2.0">Apache License</a> unless otherwise noted.</div>
  <div class="attribution">
    <a href="http://github.com/jverkoey/three20.info">Source hosted on github</a> -
    Made with the <a href="http://github.com/jverkoey/Keystone">Keystone</a> framework.
    </div>
</div>

<?
if( APPLICATION_ENV == 'development' ) {
  $this->addJsFootScript('var disqus_developer = 1;');
}

$this->addJsFootFile('http://disqus.com/forums/three20/embed.js');
$this->addJsFootScript('
  var is_ssl = ("https:" == document.location.protocol);
  var asset_host = is_ssl ? "https://s3.amazonaws.com/getsatisfaction.com/" : "http://s3.amazonaws.com/getsatisfaction.com/";
  document.write(unescape("%3Cscript src=\'" + asset_host + "javascripts/feedback-v2.js\' type=\'text/javascript\'%3E%3C/script%3E"));
');

$this->addJsFootScript('
  var feedback_widget_options = {};

  feedback_widget_options.display = "overlay";  
  feedback_widget_options.company = "three20";
  feedback_widget_options.placement = "left";
  feedback_widget_options.color = "#FC9";
  feedback_widget_options.style = "idea";

  var feedback_widget = new GSFN.feedback_widget(feedback_widget_options);
');

if( APPLICATION_ENV != 'development' ) {
$this->addJsFootScript('
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));
');

$this->addJsFootScript('
try {
var pageTracker = _gat._getTracker("'.ANALYTICS_KEY.'");
pageTracker._trackPageview();
} catch(err) {}');
 }
?>

<?= $this->jsFoot() ?>
</body>
</html>
