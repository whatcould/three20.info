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
    <ul>
      <li><a href="/issues">Issues</a></li>
      <li><a href="/contribute">Contribute</a></li>
      <li><input type="text" id="globallookup" placeholder="Instant Class Lookup" /></li>
    </ul>
  </div>
</div>
<div id="pageheadershadow"></div>

<div class="fixedwidth">
<div id="toc">
  <div class="header">Getting Started</div>
  <ul>
    <li><a href="/setup/existing">Add three20 to your Project</a></li>
    <li><a href="/setup/templates">Three20 Project Templates</a></li>
  </ul>
  <div class="header">Articles</div>
  <ul>
    <li><a href="/core/debugging">Debugging with three20</a></li>
    <li><a href="/core/navigation">URL-Based Navigation</a></li>
  </ul>
  <div class="header">API</div>
  <ul>
    <li><a href="/api/globalmethods">Global Methods</a></li>
    <li><a href="/api/TTModel">TTModel</a></li>
    <li><a href="/api/TTNavigator">TTNavigator</a></li>
    <li><a href="/api/TTURLMap">TTURLMap</a></li>
    <li><a href="/api/additions">Additions</a></li>
  </ul>
  <div class="header">Style</div>
  <ul>
    <li><a href="/api/TTStyle">TTStyle</a></li>
  </ul>
  <div class="header">View Controller</div>
  <ul>
    <li><a href="/api/TTActionSheetController">TTActionSheetController</a></li>
    <li><a href="/api/TTAlertViewController">TTAlertViewController</a></li>
    <li><a href="/api/TTMessageController">TTMessageController</a></li>
    <li><a href="/api/TTModelViewController">TTModelViewController</a></li>
    <li><a href="/api/TTPostController">TTPostController</a></li>
    <li><a href="/api/TTPopupViewController">TTPopupViewController</a></li>
    <li><a href="/api/TTTextBarController">TTTextBarController</a></li>
    <li><a href="/api/TTViewController">TTViewController</a></li>
    <li><a href="/api/TTWebController">TTWebController</a></li>
  </ul>
  <div class="header">View</div>
  <ul>
    <li><a href="/api/TTView">TTView</a></li>
    <li><a href="/api/TTImageView">TTImageView</a></li>
    <li><a href="/api/TTLauncherView">TTLauncherView</a></li>
    <li><a href="/api/TTScrollView">TTScrollView</a></li>
    <li><a href="/api/TTYouTubeView">TTYouTubeView</a></li>
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

<noscript><p><img alt="Clicky" width="1" height="1" src="http://static.getclicky.com/155532ns.gif" /></p></noscript>

<?
if( APPLICATION_ENV == 'development' ) {
  $this->addJsFootScript('var disqus_developer = 1;');
}

if( APPLICATION_ENV != 'development' ) {
if( !isset($this->hideDisqusThread) ) {
  $this->addJsFootFile('http://disqus.com/forums/three20/embed.js');
}
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
}

if( APPLICATION_ENV != 'development' ) {
$this->addJsFootScript('
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));
');

$this->addJsFootFile('http://static.getclicky.com/js');
$this->addJsFootScript('clicky.init(155532);');

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
