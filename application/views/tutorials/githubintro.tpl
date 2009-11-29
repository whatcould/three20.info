How to build a GitHub iPhone app with three20
=============================================

<div class="source">
  Intro -
  <a href="/tutorials/githubpage2">User Model</a> -
  <a href="/tutorials/githubpage3">User View</a>
</div>

We're going to build a GitHub iPhone app using the public [GitHub api](http://develop.github.com/).
The goal throughout these tutorials is to introduce you to the various aspects of three20 while
building something with a clear final result and purpose.

Before we begin, I want to give thanks to Joe Hewitt for his work on the three20 library.
Building an app like this would take a lot longer to develop and design without it.

Let's get started!

To begin, let's start a new project. We're going to build this app using Core Data (don't worry if
you haven't used it yet, it's surprisingly easy to pick up). To speed up this step, I'm going to
use [the three20 project templates](/setup/templates).

<div class="image" markdown=1>![Create a new project](/gfx/tutorial/github/newproject.png 409x318)</div>

Once you've created the project, make sure you can build and run it. The default three20 template
app should load three20.info in a web browser.

Let's start looking at the code.

Three20 and URL-Based Navigation
================================

Open AppDelegate.m and check out the following code in `applicationDidFinishLaunching`.

<div class="sectiontags" markdown="1">
* AppDelegate.m
</div>
<div class="clearfix"></div>

."brush: obj-c"
    TTNavigator* navigator = [TTNavigator navigator];
    navigator.persistenceMode = TTNavigatorPersistenceModeAll;

While we're developing we don't want the navigator to persist the navigation
history (unless we're testing persistence), so for the time being let's change the persistence mode
to none.

<div class="sectiontags" markdown="1">
* AppDelegate.m
* modifications
</div>
<div class="clearfix"></div>

."brush: obj-c"
    navigator.persistenceMode = TTNavigatorPersistenceModeNone;

Now let's look at the URL mappings.

<div class="sectiontags" markdown="1">
* AppDelegate.m
</div>
<div class="clearfix"></div>

."brush: obj-c"
    TTURLMap* map = navigator.URLMap;
    [map from:@"*" toViewController:[TTWebController class]];

This is where we start adding the basic navigation mappings. This mapping will catch any url and
open it with the standard three20 web controller, which displays a web view with standard toolbar
buttons.

<div class="sectiontags" markdown="1">
* AppDelegate.m
</div>
<div class="clearfix"></div>

."brush: obj-c"
    if (![navigator restoreViewControllers]) {
      [navigator openURL:@"http://three20.info" animated:NO];
    }

Now that we've set up some basic mappings, we launch the app with the default URL, in this case
three20.info.

<div class="image" markdown=1>![three20.info](/gfx/tutorial/github/three20info.png 320x480)</div>

Adding Our First Three20 Controller
===================================

Let's start off with something personable; a user view.

This part of the tutorial is going to cover creating a three20 table view controller, building a
url request-based model, and populating the table with content retrieved from the web.

Let's start by creating a new view controller. You can name it whatever you like, but I'll refer
to it as `UserViewController` from here on out. I create my view controllers from the
Objective-C class template to avoid having to remove the stock code placed in the UIViewController
subclass template, so bear that in mind as we plow through the code.

Once you've created your controller, open the .h file and replace UIViewController with
TTTableViewController. We're going to create our user view controller using a github username, so
we'll also add a username property.

<div class="sectiontags" markdown="1">
* UserViewController.h
* new code
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @interface UserViewController : TTTableViewController {
      NSString* _username;
    }

    @property (nonatomic, copy) NSString* username;

    @end

Then, in the .m file, we'll add the following initializers.

<div class="sectiontags" markdown="1">
* UserViewController.m
* new code
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @implementation UserViewController

    @synthesize username = _username;

    - (id)initWithUsername:(NSString*)username {
      // Note the [self init] here instead of [super init].
      if (self = [self init]) {
        self.username = username;
      }

      return self;
    }

    - (id)init {
      if (self = [super init]) {
        self.tableViewStyle = UITableViewStyleGrouped;
        self.variableHeightRows = YES;
      }

      return self;
    }

    - (void)dealloc {
      TT_RELEASE_SAFELY(_username);
      [super dealloc];
    }

    @end

Now let's start actually seeing some progress.

Start by heading back to AppDelegate.m and adding `UserViewController.h` to the list of includes.
Then add the following mapping to `applicationDidFinishLaunching`.

<div class="sectiontags" markdown="1">
* AppDelegate.m
* new code and modifications
</div>
<div class="clearfix"></div>

."brush: obj-c"
    #import "UserViewController.h"

    - (void)applicationDidFinishLaunching:(UIApplication *)application {

      ...
    
      [map from:@"*" toViewController:[TTWebController class]];

      [map from:@"http://github.com/(initWithUsername:)"
           toViewController:[UserViewController class]];

Our goal here is to map URLs like `http://github.com/jverkoey` to our UserViewController object. When
we open any url with this format, a new UserViewController object will be created and
`initWithUsername:` will be called.

So let's see it in action. We'll modify the default URL we open the app with:

<div class="sectiontags" markdown="1">
* AppDelegate.m
* modification
</div>
<div class="clearfix"></div>

."brush: obj-c"
    if (![navigator restoreViewControllers]) {
      [navigator openURL:@"http://github.com/your_username" animated:NO];
    }

Try running the app now and this is what you should see.

<div class="image" markdown=1>![Loading...](/gfx/tutorial/github/userloadingview.png 320x480)</div>

### Troubleshooting

**After changing the URL in `navigator openURL` and running the app, it still loads the web view.
What gives?**

> This is a result of `[navigator restoreViewControllers]`. The app stores its navigation history
> when the app closes, so if you closed the app with the web view open and the persistence
> mode was still set to "All", your navigation history currently contains the URL
> `http://three20.info`
>
> To fix this, simply delete the app and rebuild. This will clear the navigation history.

[Continue this tutorial on page 2...](/tutorials/githubpage2)
