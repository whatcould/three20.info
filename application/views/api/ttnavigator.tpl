<?= $this->pageTitle() ?>
=========================

TTNavigator is a global object that provides an alternative method of navigation to traditional
UIViewController navigation.

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [How to use it](#howto)
* [Properties](#properties)
* [Methods](#methods)
* [TTNavigatorDelegate](#TTNavigatorDelegate)
</div>
<div class="clearfix"></div>

Related Articles
----------------

<div class="toc" markdown="1">
* [URL-Based Navigation](/core/navigation)
</div>
<div class="clearfix"></div>


How to use it {#howto}
=============

`[TTNavigator navigator]` to access the global navigator instance.

Examples
--------

."brush: obj-c"
    - (void)applicationDidFinishLaunching: (UIApplication*)application {
      TTNavigator* navigator = [TTNavigator navigator];
      navigator.persistenceMode       = TTNavigatorPersistenceModeAll;
      navigator.supportsShakeToReload = YES;
      navigator.delegate              = self;
    }

> Note: If you do not set the [window](#window) property, TTNavigator will automatically create the
> window for you.

."brush: obj-c"
    NSDictionary* query = [NSDictionary dictionaryWithObjectsAndKeys:
      page, @"page",
      nil];
    [[TTNavigator navigator] openURL:@"tt://info" query:query animated:YES];

Opens a URL with a query. This will call whatever method `tt://info` maps to with an extra
`query:(NSDictionary*)query` parameter.

Properties {#properties}
==========

### delegate {#delegate}

."brush: obj-c"
    @property (nonatomic, assign) id<TTNavigatorDelegate> delegate

Should implement the [TTNavigatorDelegate](#TTNavigatorDelegate) protocol.

### URLMap {#URLMap}

."brush: obj-c"
    @property (nonatomic, readonly) TTURLMap* URLMap

The URL map used to translate between URLs and view controllers.  
Learn more about [TTURLMap](/api/TTURLMap).

### window {#window}

."brush: obj-c"
    @property (nonatomic, retain) UIWindow* window

The window that contains the view controller hierarchy. If no window is assigned, TTNavigator
will automatically create a window when openURL is called.

### rootViewController {#rootViewController}

."brush: obj-c"
    @property (nonatomic, readonly) UIViewController* rootViewController

The controller that is at the root of the view controller hierarchy.

### visibleViewController {#visibleViewController}

."brush: obj-c"
    @property (nonatomic, readonly) UIViewController* visibleViewController

The currently visible view controller.

### topViewController {#topViewController}

."brush: obj-c"
    @property (nonatomic, readonly) UIViewController* topViewController

The view controller that is currently on top of the navigation stack.

This differs from [visibleViewController](#visibleViewController) in that it ignores things
like search display controllers which are visible, but not part of navigation.

### URL {#URL}

."brush: obj-c"
    @property (nonatomic, copy) NSString* URL

The URL of the currently visible view controller.

Setting this property will open a new URL.

### persistenceMode {#persistenceMode}

."brush: obj-c"
    @property (nonatomic) TTNavigatorPersistenceMode persistenceMode

How view controllers are automatically persisted on termination and restored on launch.

Possible modes:

* `TTNavigatorPersistenceModeNone` no persistence
* `TTNavigatorPersistenceModeTop` persists only the top-level controller
* `TTNavigatorPersistenceModeAll` persists all navigation paths

### persistenceExpirationAge {#persistenceExpirationAge}

<div class="sectiontags" markdown="1">
* Default: 0
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @property (nonatomic) NSTimeInterval persistenceExpirationAge

The age at which persisted view controllers are too old to be restored.

In some cases, it is a good practice not to restore really old navigation paths, because
the user probably won't remember how they got there, and would prefer to start from the
beginning.

Set this to 0 to restore from any age.

### supportsShakeToReload {#supportsShakeToReload}

<div class="sectiontags" markdown="1">
* Default: NO
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @property (nonatomic) BOOL supportsShakeToReload

Causes the current view controller to be reloaded when shaking the phone.

### opensExternalURLs {#opensExternalURLs}

<div class="sectiontags" markdown="1">
* Default: NO
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @property (nonatomic) BOOL opensExternalURLs

Allows URLs to be opened externally if they don't match any patterns.

### isDelayed {#isDelayed}

<div class="sectiontags" markdown="1">
* Default: NO
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @property (nonatomic, readonly) BOOL isDelayed

Indicates that controllers delay heavy operations until a later time.

Methods {#methods}
=======

### navigator {#navigator}

."brush: obj-c"
    + (TTNavigator*)navigator

The global navigator instance. [TTOpenURL](#TTOpenURL) uses this to navigate to a URL. Most of
the three20 code makes the assumption that you are using the global navigator accessed from
`[TTNavigator navigator]`.

### TTOpenURL {#TTOpenURL}

."brush: obj-c"
    UIViewController* TTOpenURL(NSString* URL)

Shortcut for calling `[[TTNavigator navigator] openURL:]`.

TTNavigatorDelegate {#TTNavigatorDelegate}
===================

### shouldOpenURL: {#shouldOpenURL:}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (BOOL)navigator: (TTNavigator*)navigator shouldOpenURL: (NSURL*)URL

Asks if the URL should be opened and allows the delegate to prevent it.

### willOpenURL:inViewController: {#willOpenURL:inViewController:}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)navigator: (TTNavigator*)navigator willOpenURL: (NSURL*)URL
            inViewController: (UIViewController*)controller;

The URL is about to be opened in a controller.  
If the controller argument is nil, the URL is going to be opened externally.


