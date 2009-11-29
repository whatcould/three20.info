How to build a GitHub iPhone app with three20
=============================================

<div class="source">
  <a href="/tutorials/githubintro">Intro</a> -
  <a href="/tutorials/githubpage2">User Model</a> -
  User View
</div>

By now your app should be making a request to the github api server, receiving the data, and parsing
the xml into an NSDictionary. Let's turn that data into something visual.

Let's shoot for mimicking the GitHub UI while still retaining the look and feel of the iPhone UI.

Here's what the current GitHub UI looks like:

<div class="image" markdown=1>![The GitHub UI](/gfx/tutorial/github/githubui.png 500x115)</div>

Let's start by adding the key-value pairs directly below the user icon and username.


