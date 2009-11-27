<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [How to use it](#howto)
* [Methods](#methods)
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

Retrieve the global navigator object via `[TTNavigator navigator].URLMap`.

It is suggested that you set up your URL mappings in `applicationDidFinishLaunching`.

Examples
--------

."brush: obj-c"
    TTNavigator* navigator = [TTNavigator navigator];
    TTURLMap* map = navigator.URLMap;

    [map from:@"*" toViewController:[TTWebController class]];

Any URL that doesn't match will fall back on this one and open in the web browser.

."brush: obj-c"
    [map from:@"tt://info" toViewController:[InfoViewController class]];

When the url `"tt://info"` is opened, an instance of `InfoViewController` is created and the standard
`init` method is called.

."brush: obj-c"
    [map from:@"tt://contact/(initWithName:)/(phoneNumber:)"
      toViewController:[ContactViewController class]];

When the url `"tt://contact/three20/1234567"` is opened, an instance of `ContactViewController` is
created and  
`initWithName:@"three20" phoneNumber:1234567` is called.

."brush: obj-c"
    [map from:[Contact class] name:@"view"
      toURL:@"tt://contact/(name)/(phoneNumber)"];
    [aContact URLValueWithName:@"view"] => @"tt://contact/three20/1234567"

This allows you to take a Contact object and turn it into a URL. Any readable property of an object
can be used when constructing the URL. In this case we assume that Contact has a `name` and
`phoneNumber` property.


Methods {#methods}
=======

### from:toObject: {#from:toObject:}

."brush: obj-c"
    - (void)from:(NSString*)URL toObject:(id)object

Adds a URL pattern which will perform a selector determined from the URL on an object when loaded.

Useful for when you have a global object and an action which you'd like to perform upon the object.

### from:toObject:selector: {#from:toObject:selector:}

."brush: obj-c"
    - (void)from:(NSString*)URL toObject:(id)object selector:(SEL)selector

Adds a URL pattern which will perform a selector on an object when loaded.

### from:toViewController: {#from:toViewController:}

."brush: obj-c"
    - (void)from:(NSString*)URL toViewController:(id)target

Adds a URL pattern which will create and present a view controller when loaded.

The selector will be called on the view controller after it is created and arguments from
the URL will be extracted using the pattern and passed to the selector.

target can be either a Class which is a subclass of UIViewController, or an object which
implements a method that returns a UIViewController instance.  If you use an object, the
selector will be called with arguments extracted from the URL, and the view controller that
you return will be the one that is presented.

### from:toViewController:selector: {#from:toViewController:selector:}

."brush: obj-c"
    - (void)from:(NSString*)URL toViewController:(id)target selector:(SEL)selector

Adds a URL pattern which will create and present a view controller when loaded.

target can be either a Class which is a subclass of UIViewController, or an object which
implements a method that returns a UIViewController instance.  If you use an object, the
selector will be called with arguments extracted from the URL, and the view controller that
you return will be the one that is presented.

The selector will be called on the view controller after it is created. The selector may accept
an extra `NSDictionary*` object as its final parameter if it wishes to handle queries.

### from:toViewController:transition: {#from:toViewController:transition:}

."brush: obj-c"
    - (void)from:(NSString*)URL
      toViewController:(id)target
            transition:(NSInteger)transition

Adds a URL pattern which will create and present a view controller when loaded.

The selector will be called on the view controller after it is created and arguments from
the URL will be extracted using the pattern and passed to the selector.

target can be either a Class which is a subclass of UIViewController, or an object which
implements a method that returns a UIViewController instance.  If you use an object, the
selector will be called with arguments extracted from the URL, and the view controller that
you return will be the one that is presented.

transition may be any of the `UIViewAnimationTransition` values.

### from:toViewController:selector:transition: {#from:toViewController:selector:transition:}

."brush: obj-c"
    - (void)from:(NSString*)URL
                parent:(NSString*)parentURL
      toViewController:(id)target
              selector:(SEL)selector
            transition:(NSInteger)transition

Adds a URL pattern which will create and present a view controller when loaded.

target can be either a Class which is a subclass of UIViewController, or an object which
implements a method that returns a UIViewController instance.  If you use an object, the
selector will be called with arguments extracted from the URL, and the view controller that
you return will be the one that is presented.

The selector will be called on the view controller after it is created. The selector may accept
an extra `NSDictionary*` object as its final parameter if it wishes to handle queries.

transition may be any of the `UIViewAnimationTransition` values.

### from:toSharedViewController: {#from:toSharedViewController:}

."brush: obj-c"
    - (void)from:(NSString*)URL toSharedViewController:(id)target

Adds a URL pattern which will create and present a share view controller when loaded.

Controllers created with the "share" mode, meaning that it will be created once and re-used
until it is destroyed.

### from:toSharedViewController:selector: {#from:toSharedViewController:selector:}

."brush: obj-c"
    - (void)from:(NSString*)URL toSharedViewController:(id)target selector:(SEL)selector

Adds a URL pattern which will create and present a share view controller when loaded.

Controllers created with the "share" mode, meaning that it will be created once and re-used
until it is destroyed.

The selector will be called on the view controller after it is created. The selector may accept
an extra `NSDictionary*` object as its final parameter if it wishes to handle queries.

### from:parent:toSharedViewController: {#from:parent:toSharedViewController:}

."brush: obj-c"
    - (void)from:(NSString*)URL
                      parent:(NSString*)parentURL
      toSharedViewController:(id)target

Adds a URL pattern which will create and present a share view controller when loaded.

Controllers created with the "share" mode, meaning that it will be created once and re-used
until it is destroyed.

The parentURL will be opened before opening this URL.

### from:parent:toSharedViewController:selector: {#from:parent:toSharedViewController:selector:}

."brush: obj-c"
    - (void)from:(NSString*)URL
                      parent:(NSString*)parentURL
      toSharedViewController:(id)target
                    selector:(SEL)selector

Adds a URL pattern which will create and present a share view controller when loaded.

Controllers created with the "share" mode, meaning that it will be created once and re-used
until it is destroyed.

The parentURL will be opened before opening this URL.

The selector will be called on the view controller after it is created. The selector may accept
an extra `NSDictionary*` object as its final parameter if it wishes to handle queries.

### from:toModalViewController: {#from:toModalViewController:}

."brush: obj-c"
    - (void)from:(NSString*)URL toModalViewController:(id)target

Adds a URL pattern which will create and present a modal view controller when loaded.

### from:toModalViewController:selector: {#from:toModalViewController:selector:}

."brush: obj-c"
    - (void)from:(NSString*)URL toModalViewController:(id)target selector:(SEL)selector

Adds a URL pattern which will create and present a modal view controller when loaded.

The selector will be called on the view controller after it is created. The selector may accept
an extra `NSDictionary*` object as its final parameter if it wishes to handle queries.

### from:toModalViewController:transition: {#from:toModalViewController:transition:}

."brush: obj-c"
    - (void)from:(NSString*)URL
      toModalViewController:(id)target
                 transition:(NSInteger)transition

Adds a URL pattern which will create and present a modal view controller when loaded.

transition may be any of the `UIViewAnimationTransition` values.

### from:parent:toModalViewController:selector: {#from:parent:toModalViewController:selector:}

."brush: obj-c"
    - (void)from:(NSString*)URL
                      parent:(NSString*)parentURL
      toModalViewController:(id)target
                    selector:(SEL)selector
                  transition:(NSInteger)transition

Adds a URL pattern which will create and present a modal view controller when loaded.

The parentURL will be opened before opening this URL.

The selector will be called on the view controller after it is created. The selector may accept
an extra `NSDictionary*` object as its final parameter if it wishes to handle queries.

transition may be any of the `UIViewAnimationTransition` values.

### from:toURL: {#from:toURL:}

."brush: obj-c"
    - (void)from:(Class)cls toURL:(NSString*)URL

Adds a mapping from a class to a generated URL.

This and its sibling method, `from:name:toURL:`, is especially useful when you want to map from an
object to a URL in a table view controller.

### from:name:toURL: {#from:name:toURL:}

."brush: obj-c"
    - (void)from:(Class)cls name:(NSString*)name toURL:(NSString*)URL

Adds a mapping from a class and a special name to a generated URL.

### setObject:forURL: {#setObject:forURL:}

."brush: obj-c"
    - (void)setObject:(id)object forURL:(NSString*)URL

Adds a direct mapping from a literal URL to an object.

The URL must not be a pattern - it must be the a literal URL. All requests to open this URL will
return the object bound to it, rather than going through the pattern matching process to create
a new object.

Mapped objects are not retained.  You are responsible for removing the mapping when the object
is destroyed, or risk crashes.

### removeURL: {#removeURL:}

."brush: obj-c"
    - (void)removeURL:(NSString*)URL

Removes all objects and patterns mapped to a URL.

### removeObject: {#removeObject:}

."brush: obj-c"
    - (void)removeObject:(id)object

Removes all URLs bound to an object.

### removeObjectForURL: {#removeObjectForURL:}

."brush: obj-c"
    - (void)removeObjectForURL:(NSString*)URL

Removes objects bound literally to the URL.

### removeAllObjects {#removeAllObjects}

."brush: obj-c"
    - (void)removeAllObjects

Removes all bound objects.

### objectForURL: {#objectForURL:}

."brush: obj-c"
    - (id)objectForURL:(NSString*)URL

Gets or creates the object with a pattern that matches the URL.

Object mappings are checked first, and if no object is bound to the URL then pattern
matching is used to create a new object.

### objectForURL:query: {#objectForURL:query:}

."brush: obj-c"
    - (id)objectForURL:(NSString*)URL query:(NSDictionary*)query

Gets or creates the object with a pattern that matches the URL.

Object mappings are checked first, and if no object is bound to the URL then pattern
matching is used to create a new object.

### objectForURL:query:pattern: {#objectForURL:query:pattern:}

."brush: obj-c"
    - (id)objectForURL:(NSString*)URL query:(NSDictionary*)query pattern:(TTURLNavigatorPattern**)pattern

Gets or creates the object with a pattern that matches the URL.

Object mappings are checked first, and if no object is bound to the URL then pattern
matching is used to create a new object.

### dispatchURL:toTarget:query: {#dispatchURL:toTarget:query:}

."brush: obj-c"
    - (id)dispatchURL:(NSString*)URL toTarget:(id)target query:(NSDictionary*)query

Undocumented

### navigationModeForURL: {#navigationModeForURL:}

."brush: obj-c"
    - (TTNavigationMode)navigationModeForURL:(NSString*)URL

Tests if there is a pattern that matches the URL and if so returns its navigation mode.

### transitionForURL: {#transitionForURL:}

."brush: obj-c"
    - (NSInteger)transitionForURL:(NSString*)URL

Tests if there is a pattern that matches the URL and if so returns its transition.

### isSchemeSupported: {#isSchemeSupported:}

."brush: obj-c"
    - (BOOL)isSchemeSupported:(NSString*)scheme

Returns YES if there is a registered pattern with the URL scheme.

### isAppURL: {#isAppURL:}

."brush: obj-c"
    - (BOOL)isAppURL:(NSURL*)URL

Returns YES if the URL is destined for an external app.

### URLForObject: {#URLForObject:}

."brush: obj-c"
    - (NSString*)URLForObject:(id)object

Gets a URL that has been mapped to the object.

### URLForObject:withName: {#URLForObject:withName:}

."brush: obj-c"
    - (NSString*)URLForObject:(id)object withName:(NSString*)name

Gets a URL that has been mapped to the object with the given name.
