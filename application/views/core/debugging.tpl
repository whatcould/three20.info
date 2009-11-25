<?= $this->pageTitle() ?>
=========================

<div class="source">Source: <a href="http://wiki.github.com/facebook/three20/debugging-with-three20">github</a></div>

[TTDebug.h](http://github.com/facebook/three20/blob/master/src/Three20/TTDebug.h")
contains a set of useful debug tools including priority-based logging and
debug-only assertions. These macros deprecate the old-style `TTLOG`
macros that were difficult to disable (and tended to cause an unending stream of log messages).
The goal of the new logging framework is to make it easy to see the logs you care about.

### Table of Contents

<div class="toc" markdown="1">
* [How to turn on logging](#turnonlogging)
* [Logging](#logging)
* [Debug-only assertions](#debugassertions)
</div>
<div class="clearfix"></div>

How to turn on logging {#turnonlogging}
======================

All you need to do is define a `DEBUG` preprocessor definition in the `GCC_PREPROCESSOR_DEFINITIONS`
option in your debug target settings. You shouldn't define this for your release build.
<div class="image" markdown=1>![Add the preprocessor definitions](/gfx/core/debugging/preprocessor.png 339x35)</div>

If you want to enable logging for three20, you will need to add a preprocessor definition to the
three20 lib like so: `TTMAXLOGLEVEL=TTLOGLEVEL_INFO`

Logging {#logging}
=======

The logging system introduces a new set of macros.

."brush: obj-c;"
    TTDERROR(text, ...)    // Priority level 1
    TTDWARNING(text, ...)  // Priority level 3
    TTDINFO(text, ...)     // Priority level 5
    TTDPRINT(text, ...)

Each of the above logging macros eventually routes the logs through `TTDPRINT`, but the messages
will only be displayed if the message's priority level is below the `TTMAXLOGLEVEL` threshold.  If
you don't explicitly set `TTMAXLOGLEVEL`, the default is set to `TTLOGLEVEL_WARNING`, meaning only
warning and error logs will be displayed.

The standard output of `TTDPRINT` looks something like this:

."brush: obj-c;"
    TTDPRINT(@"Is this thing on?");
    2009-11-20 13:46:49.613 AppName /path/to/file/Filename.m(86): Is this thing on?

Debug-only assertions {#debugassertions}
=====================

It can often be useful to validate the parameters passed into a method.  Generally the method
may return preemptively if the parameters are invalid or missing and this allows a way to fail
somewhat gracefully.  When you're actively developing code, however, it would be ideal if the
method could shout out to you "hey, listen!", letting you know that the method is being
abused.

This is where `TTDASSERT` comes in.  It works like a regular
assertion, in that if you pass a value of FALSE to it it chokes up, but it has the nice benefit
of not crashing your app. Instead, it jumps straight into the debugger at the line that caused the
issue. It's also gracefully compiled away in release builds, so your shipping product will
never know they existed.

Consider this example:

."brush: obj-c;"
    -(void)safeAddSubview:(UIView*)view {
      TTDASSERT(nil != view);
      if (nil == view) {
        return;
      }
      [self addSubview:view];
    }

Let's say we then call `[myView safeAddSubview:nil]`. In debug builds of the app, calling this
will now toss us into the debugger at the culprit line and output a quick log explaining the
problem.

."brush: obj-c;"
    2009-11-20 14:10:53.096 AppName...
      /path/to/file/Filename.m(86): TTDASSERT failed: nil != view

Some things to note about debug assertions.
-------------------------------------------

Debug assertions will only fire in the simulator. On the actual device the assertion will fail,
output a log message, and then carry forward.

If you're in the simulator and debug assertions aren't starting up the debugger, it's likely
because you're not starting the app with gdb attached. To ensure that you always start the app in
the debugger, use the hot-key Cmd+Y instead of Cmd+Enter.
