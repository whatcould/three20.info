<h1><?= $this->pageTitle() ?></h1>
<div class="source">Source: <a href="http://wiki.github.com/facebook/three20/debugging-with-three20">github</a></div>

<p><a href="http://github.com/facebook/three20/blob/master/src/Three20/TTDebug.h">TTDebug.h</a>
  contains a set of useful debug tools including priority-based logging and
  debug-only assertions. These macros deprecate the old-style <span class="inline">TTLOG</span>
  macros that were difficult to disable (and tended to cause an unending stream of log messages).
  The goal of the new logging framework is to make it easy to see the logs you care about.</p>

<h1>How to turn on logging</h1>

<p>All you need to do is define a <span class="inline">DEBUG</span> preprocessor definition in the
  <span class="inline">GCC_PREPROCESSOR_DEFINITIONS</span> option in your debug target settings.
  You shouldn't define this for your release build.
  <div class="image"><img src="/gfx/core/debugging/preprocessor.png" width="339" height="35" alt="Add the preprocessor definitions"/></div>
  </p>

<p>If you want to enable logging for three20, you will need to add a preprocessor definition to the
  three20 lib like so: <span class="inline">TTMAXLOGLEVEL=TTLOGLEVEL_INFO</span></p>

<h1>Logging</h1>

<p>The logging system introduces a new set of macros.</p>

<pre class="brush: obj-c;">TTDERROR(text, ...)    // Priority level 1
TTDWARNING(text, ...)  // Priority level 3
TTDINFO(text, ...)     // Priority level 5
TTDPRINT(text, ...)
</pre>

<p>Each of the above logging macros eventually routes the logs through
  <span class="inline">TTDPRINT</span>, but the messages will only be displayed if the message's
  priority level is below the <span class="inline">TTMAXLOGLEVEL</span> threshold.  If you don't
  explicitly set <span class="inline">TTMAXLOGLEVEL</span>, the default is set to
  <span class="inline">TTLOGLEVEL_WARNING</span>, meaning only warning and error logs will be
  displayed.</p>

<p>The standard output of <span class="inline">TTDPRINT</span> looks something like this:</p>

<pre class="brush: obj-c;">TTDPRINT(@"Is this thing on?");
2009-11-20 13:46:49.613 AppName /path/to/file/Filename.m(86): Is this thing on?</pre>

<h1>Debug-only assertions</h1>

<p>It can often be useful to validate the parameters passed into a method.  Generally the method
  may return preemptively if the parameters are invalid or missing and this allows a way to fail
  somewhat gracefully.  When you're actively developing code, however, it would be ideal if the
  method could shout out to you "hey, listen!", letting you know that the method is being
  abused.</p>

<p>This is where <span class="inline">TTDASSERT</span> comes in.  It works like a regular
  assertion, in that if you pass a value of FALSE to it it chokes up, but it has the nice benefit
  of not crashing your app. Instead, it jumps straight into the debugger at the line that caused the
  issue. It's also gracefully compiled away in release builds, so your shipping product will
  never know they existed.</p>

<p>Consider this example:</p>

<pre class="brush: obj-c;">-(void)safeAddSubview:(UIView*)view {
  TTDASSERT(nil != view);
  if (nil == view) {
    return;
  }
  [self addSubview:view];
}</pre>

<p>Let's say we then call <span class="inline">[myView safeAddSubview:nil]</span>. In debug builds
  of the app, calling this will now toss us into the debugger at the culprit line and output a
  quick log explaining the problem.</p>

<pre class="brush: obj-c;">2009-11-20 14:10:53.096 AppName /path/to/file/Filename.m(86): TTDASSERT failed: nil != view</pre>

<h2>Some things to note about debug assertions.</h2>

<p>Debug assertions will only fire in the simulator. On the actual device the assertion will fail,
  output a log message, and then carry forward.</p>

<p>If you're in the simulator and debug assertions aren't starting up the debugger, it's likely
  because you're not starting the app with gdb attached. To ensure that you always start the app in
  the debugger, use the hot-key Cmd+Y instead of Cmd+Enter.</p>
