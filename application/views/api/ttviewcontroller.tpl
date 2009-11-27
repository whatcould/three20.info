<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Properties](#properties)
* [Methods](#methods)
</div>
<div class="clearfix"></div>

Properties {#properties}
==========

### navigationBarStyle {#navigationBarStyle}

."brush: obj-c"
    @property (nonatomic) UIBarStyle navigationBarStyle;
    
The style of the navigation bar when this view controller is pushed onto a navigation controller.

### navigationBarTintColor {#navigationBarTintColor}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* navigationBarTintColor;
    
The color of the navigation bar when this view controller is pushed onto a navigation controller.

### statusBarStyle {#statusBarStyle}

."brush: obj-c"
    @property (nonatomic) UIStatusBarStyle statusBarStyle;
    
The style of the status bar when this view controller is appearing.

### searchViewController {#searchViewController}

."brush: obj-c"
    @property (nonatomic, retain) TTTableViewController* searchViewController;
    
A view controller used to display the contents of the search display controller.

If you assign a view controller to this property, it will automatically create a search
display controller which you can access through this view controller's searchDisplaController
property.  You can then take the searchBar from that controller and add it to your views. The
search bar will then search the data source of the view controller that you assigned here.

### searchController {#searchController}

."brush: obj-c"
    @property (nonatomic, readonly) TTSearchDisplayController* searchController;

### hasViewAppeared {#hasViewAppeared}

."brush: obj-c"
    @property (nonatomic, readonly) BOOL hasViewAppeared;
    
The view has appeared at least once.

### isViewAppearing {#isViewAppearing}

."brush: obj-c"
    @property (nonatomic, readonly) BOOL isViewAppearing;
    
The view is currently visible.

### autoresizesForKeyboard {#autoresizesForKeyboard}

."brush: obj-c"
    @property (nonatomic) BOOL autoresizesForKeyboard;
    
Determines if the view will be resized automatically to fit the keyboard.

Methods {#methods}
=======

### keyboardWillAppear:withBounds: {#keyboardWillAppear:withBounds:}

."brush: obj-c"
    - (void)keyboardWillAppear:(BOOL)animated withBounds:(CGRect)bounds;
    
Sent to the controller before the keyboard slides in.

### keyboardWillDisappear:withBounds: {#keyboardWillDisappear:withBounds:}

."brush: obj-c"
    - (void)keyboardWillDisappear:(BOOL)animated withBounds:(CGRect)bounds;
    
Sent to the controller before the keyboard slides out.

### keyboardDidAppear:withBounds: {#keyboardDidAppear:withBounds:}

."brush: obj-c"
    - (void)keyboardDidAppear:(BOOL)animated withBounds:(CGRect)bounds;
    
Sent to the controller after the keyboard has slid in.

### keyboardDidDisappear:withBounds: {#keyboardDidDisappear:withBounds:}

."brush: obj-c"
    - (void)keyboardDidDisappear:(BOOL)animated withBounds:(CGRect)bounds;
    
Sent to the controller after the keyboard has slid out.

