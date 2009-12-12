Welcome to three20.info
=======================

<div class="source">IRC: <a href="irc://irc.freenode.net#three20">#three20 on freenode</a></div>

<div class="sectiontags" markdown="1">
* As of Dec 11, 2009
</div>
<div class="clearfix"></div>

<div class="appstore_safe">Three20 App Store status: <strong>safe</strong></div>

This site serves to document the popular iPhone development library known as three20 and written by
Joe Hewitt.

Let's get to business. If you're looking for API documentation, use the lookup tool in the site
header or jump to any class on the left. If you'd like to contribute to three20 or three20.info,
check out the [contribute](/contribute) page. The github wiki articles have also been ported to
three20.info, you can [check them out](/articles).

There is also [three20 style documentation](/api/TTStyle). The following styles are just a few that
are covered:

<div style="text-align: center;margin-bottom:20px">
<span style="margin-right: 10px" class="image darker"><img height="48" width="144" title="" alt="Toolbar Button" src="/gfx/api/style/toolbarbutton.png"/></span>
<span style="margin-right: 10px" class="image darker"><img height="48" width="144" title="" alt="Speech Bubble" src="/gfx/api/style/speechbubble.png"/></span>
<span class="image darker"><img height="48" width="144" title="" alt="Delete Button" src="/gfx/api/style/deletebutton.png"/></span>
</div>

News {#newsheader}
====

<div id="loading" markdown="1">![Loading...](/gfx/ajax-loader.gif 43x11)</div>

<div id="news"></div>

<noscript markdown="1">
No javascript? That's cool; but you'll have to <a href="/blog/">head to the blog</a> to see the
latest updates.  
</noscript>

What's in Three20?
==================

Three20 contains a wide variety of useful UI elements. Here are just a few.

Photo Viewer
------------

TTPhotoViewController emulates Apple's Photos app with all of its flick n' pinch delight.
You can supply your own "photo sources", which works similiarly to the data sources used by
UITableView.  Unlike Apple's Photos app, it isn't limited to photos stored locally.  Your photos
can be loaded from the network, and long lists of photos can be loaded incrementally.

Message composer
----------------

TTMessageController emulates the message composer in Apple's Mail app.  You can customize it to
send any kind of message you want. Include your own set of message fields, or use the standard
"To:" and "Subject:".  Recipient names can be autocompleted from a data source that you provide.

Web image views
-----------------------

TTImageView makes it as easy to display an image as it is in HTML.  Just supply the URL of the
image, and TTImageView loads it and displays it efficiently.  TTImageView also works with the HTTP
cache described below to avoid hitting the network when possible.

Internet-aware table view controllers
---------------------------------------

TTTableViewController and TTTableViewDataSource help you to build tables which load their content
from the Internet.  Rather than just assuming you have all the data ready to go, like UITableView
does by default, TTTableViewController lets you communicate when your data is loading, and when
there is an error or nothing to display.  It also helps you to add a "More" button to load the
next page of data, and optionally supports reloading the data by shaking the device.

Better text fields
------------------

TTTextEditor is a UITextView which can grow in height automatically as you type.  I use this for
entering messages in Facebook Chat, and it behaves similarly to the editor in Apple's SMS app.

TTPickerTextField is a type-ahead UITextField.  As you type it searches a data source, and it adds
bubbles into the flow of text when you choose a type-ahead option.  I use this in
TTMessageController for selecting the names of message recipients.

HTTP disk cache
--------------

TTURLRequest is a replacement for NSURLRequest which supports a disk cache (NSURLRequest can only
cache in RAM).  It has some other nice features too.  HTTP posts are as easy as supplying a
dictionary of parameters.  The TTURL loading system can also be suspended and resumed at any time,
which is a great performance helper.  Network threads often fight with the UI thread, so you can
suspend the network any time your app is momentarily graphically intensive.

URL-based Navigation
--------------------

TTNavigationCenter is for those grizzled old web developers who want to organize their
app by "pages" which can be displayed by visiting a URL.

Your view controllers can simply register URL patterns that they handle, and when those URLs are
visited the controllers will be created and displayed.  You can also register generic actions that
are called when a URL is visited.

TTNavigationCenter also persists and restores the full path of navigation controllers and modal
view controllers, so your users can quite the app and come back exactly where they left off.
