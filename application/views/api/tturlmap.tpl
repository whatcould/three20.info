<?= $this->pageTitle() ?>
=========================



Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Methods](#methods)
</div>
<div class="clearfix"></div>

Related Articles
----------------

<div class="toc" markdown="1">
* [URL-Based Navigation](/core/navigation)
</div>
<div class="clearfix"></div>

Methods {#methods}
=======

### from:toObject: {#from:toObject:}

."brush: obj-c"
    - (void)from:(NSString*)URL toObject:(id)object

Adds a URL pattern which will perform a selector determined from the URL on an object when loaded.

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
an `NSDictionary*` object as its final parameter if it wishes to handle queries.

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
an `NSDictionary*` object as its final parameter if it wishes to handle queries.

transition may be any of the `UIViewAnimationTransition` values.
