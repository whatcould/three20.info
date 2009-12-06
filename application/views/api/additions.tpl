<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [NSObject](#NSObject)
* [NSString](#NSString)
* [NSData](#NSData)
* [NSDate](#NSDate)
* [NSArray](#NSArray)
* [NSMutableArray](#NSMutableArray)
* [NSMutableDictionary](#NSMutableDictionary)
* [UIColor](#UIColor)
* [UIFont](#UIFont)
* [UIImage](#UIImage)
* [UIViewController](#UIViewController)
* [UINavigationController](#UINavigationController)
* [UITabBarController](#UITabBarController)
* [UIView](#UIView)
* [UITableView](#UITableView)
* [UIWebView](#UIWebView)
* [UIToolbar](#UIToolbar)
* [UIWindow](#UIWindow)
</div>
<div class="clearfix"></div>

NSObject {#NSObject}
========

### performSelector:withObject:withObject:withObject: {#performSelector:withObject:withObject:withObject:}

."brush: obj-c"
    - (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3;
    
Additional performSelector signatures that support up to 7 arguments.

### performSelector:withObject:withObject:withObject:withObject: {#performSelector:withObject:withObject:withObject:withObject:}

."brush: obj-c"
    - (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
      withObject:(id)p4;
    
Additional performSelector signatures that support up to 7 arguments.

### performSelector:withObject:withObject:withObject:withObject:withObject: {#performSelector:withObject:withObject:withObject:withObject:withObject:}

."brush: obj-c"
    - (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
      withObject:(id)p4 withObject:(id)p5;
    
Additional performSelector signatures that support up to 7 arguments.

### performSelector:withObject:withObject:withObject:withObject:withObject:withObject: {#performSelector:withObject:withObject:withObject:withObject:withObject:withObject:}

."brush: obj-c"
    - (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
      withObject:(id)p4 withObject:(id)p5 withObject:(id)p6;
    
Additional performSelector signatures that support up to 7 arguments.

### performSelector:withObject:withObject:withObject:withObject:withObject:withObject:withObject: {#performSelector:withObject:withObject:withObject:withObject:withObject:withObject:withObject:}

."brush: obj-c"
    - (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
      withObject:(id)p4 withObject:(id)p5 withObject:(id)p6 withObject:(id)p7;
    
Additional performSelector signatures that support up to 7 arguments.

### URLValue {#URLValue}

."brush: obj-c"
    @property (nonatomic, readonly) NSString* URLValue;
    
Converts the object to a URL using TTURLMap.

### URLValueWithName: {#URLValueWithName:}

."brush: obj-c"
    - (NSString*)URLValueWithName:(NSString*)name;
    
Converts the object to a specially-named URL using TTURLMap.

NSString {#NSString}
========

### isWhitespace {#isWhitespace}

."brush: obj-c"
    - (BOOL)isWhitespace;
    
Determines if the string contains only whitespace.

### isEmptyOrWhitespace {#isEmptyOrWhitespace}

."brush: obj-c"
    - (BOOL)isEmptyOrWhitespace;
    
Determines if the string is empty or contains only whitespace.

### queryDictionaryUsingEncoding: {#queryDictionaryUsingEncoding:}

."brush: obj-c"
    - (NSDictionary*)queryDictionaryUsingEncoding:(NSStringEncoding)encoding;
    
Parses a URL query string into a dictionary.

### stringByAddingQueryDictionary: {#stringByAddingQueryDictionary:}

."brush: obj-c"
    - (NSString*)stringByAddingQueryDictionary:(NSDictionary*)query;
    
Parses a URL, adds query parameters to its query, and re-encodes it as a new URL.

### stringByRemovingHTMLTags {#stringByRemovingHTMLTags}

."brush: obj-c"
    - (NSString*)stringByRemovingHTMLTags;
    
Returns a string with all HTML tags removed.

### objectValue {#objectValue}

."brush: obj-c"
    - (id)objectValue;
    
Converts the string to an object using TTURLMap.

### openURL {#openURL}

."brush: obj-c"
    - (void)openURL;
    
Opens a URL with the string using TTURLMap.

### openURLFromButton: {#openURLFromButton:}

."brush: obj-c"
    - (void)openURLFromButton:(UIView*)button;
    
Opens a URL with the string using TTURLMap.

### versionStringCompare:other {#versionStringCompare:other}

<div class="sectiontags" markdown="1">
* Added December 5, 2009
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (NSComparisonResult)versionStringCompare:(NSString *)other;
    
Compares two strings expressing software versions.

The comparison is (except for the development version provisions noted below) lexicographic
string comparison. So as long as the strings being compared use consistent version formats,
a variety of schemes are supported. For example "3.02" < "3.03" and "3.0.2" < "3.0.3". If you
mix such schemes, like trying to compare "3.02" and "3.0.3", the result may not be what you
expect.

Development versions are also supported by adding an "a" character and more version info after
it. For example "3.0a1" or "3.01a4". The way these are handled is as follows: if the parts
before the "a" are different, the parts after the "a" are ignored. If the parts before the "a"
are identical, the result of the comparison is the result of NUMERICALLY comparing the parts
after the "a". If the part after the "a" is empty, it is treated as if it were "0". If one
string has an "a" and the other does not (e.g. "3.0" and "3.0a1") the one without the "a"
is newer.


Examples (?? means undefined):

    "3.0" = "3.0"
    "3.0a2" = "3.0a2"
    "3.0" > "2.5"
    "3.1" > "3.0"
    "3.0a1" < "3.0"
    "3.0a1" < "3.0a4"
    "3.0a2" < "3.0a19"  <-- numeric, not lexicographic
    "3.0a" < "3.0a1"
    "3.02" < "3.03"
    "3.0.2" < "3.0.3"
    "3.00" ?? "3.0"
    "3.02" ?? "3.0.3"
    "3.02" ?? "3.0.2"

NSData {#NSData}
======

### md5Hash {#md5Hash}

."brush: obj-c"
    @property (nonatomic, readonly) NSString* md5Hash;
    
Undocumented.

NSDate {#NSDate}
======

### dateWithToday {#dateWithToday}

."brush: obj-c"
    + (NSDate*)dateWithToday;
    
Returns the current date with the time set to midnight.

### dateAtMidnight {#dateAtMidnight}

."brush: obj-c"
    - (NSDate*)dateAtMidnight;
    
Returns a copy of the date with the time set to midnight on the same day.

### formatTime {#formatTime}

."brush: obj-c"
    - (NSString*)formatTime;
    
Formats the date with 'h:mm a' or the localized equivalent.

### formatDate {#formatDate}

."brush: obj-c"
    - (NSString*)formatDate;
    
Formats the date with 'EEEE, LLLL d, YYYY' or the localized equivalent.

### formatShortTime {#formatShortTime}

."brush: obj-c"
    - (NSString*)formatShortTime;
    
Formats the date according to how old it is.
For dates less than a day old, the format is 'h:mm a', for less than a week old the
format is 'EEEE', and for anything older the format is 'M/d/yy'.

### formatDateTime {#formatDateTime}

."brush: obj-c"
    - (NSString*)formatDateTime;
    
Formats the date according to how old it is.
For dates less than a day old, the format is 'h:mm a', for less than a week old the
format is 'EEE h:mm a', and for anything older the format is 'MMM d h:mm a'.

### formatRelativeTime {#formatRelativeTime}

."brush: obj-c"
    - (NSString*)formatRelativeTime;
    
Formats dates within 24 hours like '5 minutes ago', or calls formatDateTime if older.

### formatDay:yesterday: {#formatDay:yesterday:}

."brush: obj-c"
    - (NSString*)formatDay:(NSDateComponents*)today yesterday:(NSDateComponents*)yesterday;
    
Formats the date with "MMMM d", "Today", or "Yesterday".
You must supply date components for today and yesterday because they are relatively expensive
to create, so it is best to avoid creating them every time you call this method if you
are going to be calling it multiple times in a loop.

### formatMonth {#formatMonth}

."brush: obj-c"
    - (NSString*)formatMonth;
    
Formats the date with "MMMM".

### formatYear {#formatYear}

."brush: obj-c"
    - (NSString*)formatYear;
    
Formats the date with "yyyy".

NSArray {#NSArray}
=======

### perform: {#perform:}

."brush: obj-c"
    - (void)perform:(SEL)selector;
    
Calls performSelector on all objects in the array.

### perform:withObject: {#perform:withObject:}

."brush: obj-c"
    - (void)perform:(SEL)selector withObject:(id)p1;
    
Calls performSelector on all objects in the array.

### perform:withObject:withObject: {#perform:withObject:withObject:}

."brush: obj-c"
    - (void)perform:(SEL)selector withObject:(id)p1 withObject:(id)p2;
    
Calls performSelector on all objects in the array.

### perform:withObject:withObject:withObject: {#perform:withObject:withObject:withObject:}

."brush: obj-c"
    - (void)perform:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3;
    
Calls performSelector on all objects in the array.

### objectWithValue:forKey: {#objectWithValue:forKey:}

."brush: obj-c"
    - (id)objectWithValue:(id)value forKey:(id)key;
    
Calls performSelector on all objects in the array.

### objectWithClass: {#objectWithClass:}

."brush: obj-c"
    - (id)objectWithClass:(Class)cls;
    
Calls performSelector on all objects in the array.

### containsObject:withSelector: {#containsObject:withSelector:}

."brush: obj-c"
    - (BOOL)containsObject:(id)object withSelector:(SEL)selector;
    
Selector form:
- (BOOL)method:(id)object;

NSMutableArray {#NSMutableArray}
==============

### addNonEmptyString: {#addNonEmptyString:}

."brush: obj-c"
    - (void)addNonEmptyString:(NSString*)string;
    
Adds a string on the condition that it's non-nil and non-empty.

NSMutableDictionary {#NSMutableDictionary}
===================

### setNonEmptyString:forKey: {#setNonEmptyString:forKey:}

."brush: obj-c"
    - (void)setNonEmptyString:(NSString*)string forKey:(id)key;
    
Adds a string on the condition that it's non-nil and non-empty.

UIColorAdditions {#UIColorAdditions}
================

### colorWithHue:saturation:value:alpha: {#colorWithHue:saturation:value:alpha:}

."brush: obj-c"
    + (UIColor*)colorWithHue:(CGFloat)h saturation:(CGFloat)s value:(CGFloat)v alpha:(CGFloat)a;
    
Undocumented.

### multiplyHue:saturation:value: {#multiplyHue:saturation:value:}

."brush: obj-c"
    - (UIColor*)multiplyHue:(CGFloat)hd saturation:(CGFloat)sd value:(CGFloat)vd;
    
Undocumented.

### addHue:saturation:value: {#addHue:saturation:value:}

."brush: obj-c"
    - (UIColor*)addHue:(CGFloat)hd saturation:(CGFloat)sd value:(CGFloat)vd;
    
Undocumented.

### copyWithAlpha: {#copyWithAlpha:}

."brush: obj-c"
    - (UIColor*)copyWithAlpha:(CGFloat)newAlpha;
    
Undocumented.

### highlight {#highlight}

."brush: obj-c"
    - (UIColor*)highlight;
    
Uses multiplyHue to create a lighter version of the color.

### shadow {#shadow}

."brush: obj-c"
    - (UIColor*)shadow;
    
Uses multiplyHue to create a darker version of the color.

### hue {#hue}

."brush: obj-c"
    - (CGFloat)hue;
    
Uses multiplyHue to create a darker version of the color.

### saturation {#saturation}

."brush: obj-c"
    - (CGFloat)saturation;
    
Uses multiplyHue to create a darker version of the color.

### value {#value}

."brush: obj-c"
    - (CGFloat)value;
    
Uses multiplyHue to create a darker version of the color.

UIFont {#UIFont}
======

### lineHeight {#lineHeight}

."brush: obj-c"
    - (CGFloat)lineHeight;
    
Gets the height of a line of text with this font.
Why this isn't part of UIFont is beyond me. This is the height you would expect to get
by calling sizeWithFont.

UIImage {#UIImage}
=======

### transformWidth:height:rotate: {#transformWidth:height:rotate:}

."brush: obj-c"
    - (UIImage*)transformWidth:(CGFloat)width height:(CGFloat)height rotate:(BOOL)rotate;
    
Undocumented.

### convertRect:withContentMode: {#convertRect:withContentMode:}

."brush: obj-c"
    - (CGRect)convertRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode;
    
Undocumented.

### drawInRect:contentMode: {#drawInRect:contentMode:}

."brush: obj-c"
    - (void)drawInRect:(CGRect)rect contentMode:(UIViewContentMode)contentMode;
    
Draws the image using content mode rules.

### drawInRect:radius: {#drawInRect:radius:}

."brush: obj-c"
    - (void)drawInRect:(CGRect)rect radius:(CGFloat)radius;
    
Draws the image as a rounded rectangle.

### drawInRect:radius:contentMode: {#drawInRect:radius:contentMode:}

."brush: obj-c"
    - (void)drawInRect:(CGRect)rect radius:(CGFloat)radius contentMode:(UIViewContentMode)contentMode;
    
Draws the image as a rounded rectangle.

UIViewController {#UIViewController}
================

### initWithNavigatorURL:query: {#initWithNavigatorURL:query:}

."brush: obj-c"
    - (id)initWithNavigatorURL:(NSURL*)URL query:(NSDictionary*)query;
    
The default initializer sent to view controllers opened through TTNavigator.

### navigatorURL {#navigatorURL}

."brush: obj-c"
    @property (nonatomic, readonly) NSString* navigatorURL;
    
The current URL that this view controller represents.

### originalNavigatorURL {#originalNavigatorURL}

."brush: obj-c"
    @property (nonatomic, copy) NSString* originalNavigatorURL;
    
The URL that was used to load this controller through TTNavigator.

Do not ever change the value of this property.  TTNavigator will assign this
when creating your view controller, and it expects it to remain constant throughout
the view controller's life.  You can override navigatorURL if you want to specify
a different URL for your view controller to use when persisting and restoring it.

### canContainControllers {#canContainControllers}

."brush: obj-c"
    @property (nonatomic, readonly) BOOL canContainControllers;
    
Determines whether a controller is primarily a container of other controllers.

### superController {#superController}

."brush: obj-c"
    @property (nonatomic, retain) UIViewController* superController;
    
The view controller that contains this view controller.

This is just like parentViewController, except that it is not readonly.  This property offers
custom UIViewController subclasses the chance to tell TTNavigator how to follow the hierarchy
of view controllers.

### topSubcontroller {#topSubcontroller}

."brush: obj-c"
    - (UIViewController*)topSubcontroller;
    
The child of this view controller which is most visible.

This would be the selected view controller of a tab bar controller, or the top 
view controller of a navigation controller.  This property offers custom UIViewController
subclasses the chance to tell TTNavigator how to follow the hierarchy of view controllers.

### previousViewController {#previousViewController}

."brush: obj-c"
    - (UIViewController*)previousViewController;
    
The view controller that comes before this one in a navigation controller's history.

### nextViewController {#nextViewController}

."brush: obj-c"
    - (UIViewController*)nextViewController;
    
The view controller that comes after this one in a navigation controller's history.

### popupViewController {#popupViewController}

."brush: obj-c"
    @property (nonatomic, retain) UIViewController* popupViewController;
    
A popup view controller that is presented on top of this view controller. 

### addSubcontroller:animated:transition: {#addSubcontroller:animated:transition:}

."brush: obj-c"
    - (void)addSubcontroller:(UIViewController*)controller animated:(BOOL)animated
            transition:(UIViewAnimationTransition)transition;
    
Displays a controller inside this controller.

TTURLMap uses this to display newly created controllers.  The default does nothing --
UIViewController categories and subclasses should implement to display the controller
in a manner specific to them.  

### removeFromSupercontroller {#removeFromSupercontroller}

."brush: obj-c"
    - (void)removeFromSupercontroller;
    
Dismisses a view controller using the opposite transition it was presented with.

### removeFromSupercontrollerAnimated: {#removeFromSupercontrollerAnimated:}

."brush: obj-c"
    - (void)removeFromSupercontrollerAnimated:(BOOL)animated;
    
Dismisses a view controller using the opposite transition it was presented with.

### bringControllerToFront:animated: {#bringControllerToFront:animated:}

."brush: obj-c"
    - (void)bringControllerToFront:(UIViewController*)controller animated:(BOOL)animated;
    
Brings a controller that is a child of this controller to the front.

TTURLMap uses this to display controllers that exist already, but may not be visible.
The default does nothing -- UIViewController categories and subclasses should implement
to display the controller in a manner specific to them.  

### keyForSubcontroller: {#keyForSubcontroller:}

."brush: obj-c"
    - (NSString*)keyForSubcontroller:(UIViewController*)controller;
    
Gets a key that can be used to identify a subcontroller in subcontrollerForKey.

### subcontrollerForKey: {#subcontrollerForKey:}

."brush: obj-c"
    - (UIViewController*)subcontrollerForKey:(NSString*)key;
    
Gets a subcontroller with the key that was returned from keyForSubcontroller.

### persistView: {#persistView:}

."brush: obj-c"
    - (BOOL)persistView:(NSMutableDictionary*)state;
    
Persists aspects of the view state to a dictionary that can later be used to restore it.

This will be called when TTNavigator is persisting the navigation history so that it
can later be restored.  This usually happens when the app quits, or when there is a low
memory warning.

### restoreView: {#restoreView:}

."brush: obj-c"
    - (void)restoreView:(NSDictionary*)state;
    
Restores aspects of the view state from a dictionary populated by persistView.

This will be called when TTNavigator is restoring the navigation history.  This may 
happen after launch, or when the controller appears again after a low memory warning.

### persistNavigationPath: {#persistNavigationPath:}

."brush: obj-c"
    - (void)persistNavigationPath:(NSMutableArray*)path;
    
XXXjoe Not documenting this in the hopes that I can eliminate it ;)

### delayDidEnd {#delayDidEnd}

."brush: obj-c"
    - (void)delayDidEnd;
    
Finishes initializing the controller after a TTNavigator-coordinated delay.

If the controller was created in between calls to TTNavigator beginDelay and endDelay, then
this will be called after endDelay.

### showBars:animated: {#showBars:animated:}

."brush: obj-c"
    - (void)showBars:(BOOL)show animated:(BOOL)animated;
    
Shows or hides the navigation and status bars.

### dismissModalViewController {#dismissModalViewController}

."brush: obj-c"
    - (void)dismissModalViewController;
    
Shortcut for its animated-optional cousin.

### frozenState {#frozenState}

."brush: obj-c"
    @property (nonatomic, retain) NSDictionary* frozenState;
    
A temporary holding place for persisted view state waiting to be restored.

While restoring controllers, TTURLMap will assign this the dictionary created by persistView.
Ultimately, this state is bound for the restoreView call, but it is up to subclasses to
call restoreView at the appropriate time -- usually after the view has been created.
After you've restored the state, you should set frozenState to nil.

UINavigationController {#UINavigationController}
======================

### pushViewController:animatedWithTransition: {#pushViewController:animatedWithTransition:}

."brush: obj-c"
    - (void)pushViewController:(UIViewController*)controller
            animatedWithTransition:(UIViewAnimationTransition)transition;
    
Pushes a view controller with a transition other than the standard sliding animation.

### popViewControllerAnimatedWithTransition: {#popViewControllerAnimatedWithTransition:}

."brush: obj-c"
    - (UIViewController*)popViewControllerAnimatedWithTransition:(UIViewAnimationTransition)transition;
    
Pops a view controller with a transition other than the standard sliding animation.

UITabBarController {#UITabBarController}
==================

### setTabURLs: {#setTabURLs:}

."brush: obj-c"
    - (void)setTabURLs:(NSArray*)URLs;
    
Undocumented.

UIView {#UIView}
======

### left {#left}

."brush: obj-c"
    @property (nonatomic) CGFloat left;
    
Undocumented.

### top {#top}

."brush: obj-c"
    @property (nonatomic) CGFloat top;
    
Undocumented.

### right {#right}

."brush: obj-c"
    @property (nonatomic) CGFloat right;
    
Undocumented.

### bottom {#bottom}

."brush: obj-c"
    @property (nonatomic) CGFloat bottom;
    
Undocumented.

### width {#width}

."brush: obj-c"
    @property (nonatomic) CGFloat width;
    
Undocumented.

### height {#height}

."brush: obj-c"
    @property (nonatomic) CGFloat height;
    
Undocumented.

### centerX {#centerX}

."brush: obj-c"
    @property (nonatomic) CGFloat centerX;
    
Undocumented.

### centerY {#centerY}

."brush: obj-c"
    @property (nonatomic) CGFloat centerY;
    
Undocumented.

### screenX {#screenX}

."brush: obj-c"
    @property (nonatomic, readonly) CGFloat screenX;
    
Undocumented.

### screenY {#screenY}

."brush: obj-c"
    @property (nonatomic, readonly) CGFloat screenY;
    
Undocumented.

### screenViewX {#screenViewX}

."brush: obj-c"
    @property (nonatomic, readonly) CGFloat screenViewX;
    
Undocumented.

### screenViewY {#screenViewY}

."brush: obj-c"
    @property (nonatomic, readonly) CGFloat screenViewY;
    
Undocumented.

### screenFrame {#screenFrame}

."brush: obj-c"
    @property (nonatomic, readonly) CGRect screenFrame;
    
Undocumented.

### origin {#origin}

."brush: obj-c"
    @property (nonatomic) CGPoint origin;
    
Undocumented.

### size {#size}

."brush: obj-c"
    @property (nonatomic) CGSize size;
    
Undocumented.

### orientationWidth {#orientationWidth}

."brush: obj-c"
    @property (nonatomic, readonly) CGFloat orientationWidth;
    
Undocumented.

### orientationHeight {#orientationHeight}

."brush: obj-c"
    @property (nonatomic, readonly) CGFloat orientationHeight;
    
Undocumented.

### descendantOrSelfWithClass: {#descendantOrSelfWithClass:}

."brush: obj-c"
    - (UIView*)descendantOrSelfWithClass:(Class)cls;
    
Finds the first descendant view (including this view) that is a member of a particular class.

### ancestorOrSelfWithClass: {#ancestorOrSelfWithClass:}

."brush: obj-c"
    - (UIView*)ancestorOrSelfWithClass:(Class)cls;
    
Finds the first ancestor view (including this view) that is a member of a particular class.

### removeAllSubviews {#removeAllSubviews}

."brush: obj-c"
    - (void)removeAllSubviews;
    
Removes all subviews.

### simulateTapAtPoint: {#simulateTapAtPoint:}

."brush: obj-c"
    - (void)simulateTapAtPoint:(CGPoint)location;
    
WARNING: This depends on undocumented APIs and may be fragile.  For testing only.

### offsetFromView: {#offsetFromView:}

."brush: obj-c"
    - (CGPoint)offsetFromView:(UIView*)otherView;
    
Calculates the offset of this view from another view in screen coordinates.

### frameWithKeyboardSubtracted: {#frameWithKeyboardSubtracted:}

."brush: obj-c"
    - (CGRect)frameWithKeyboardSubtracted:(CGFloat)plusHeight;
    
Calculates the frame of this view with parts that intersect with the keyboard subtracted.
If the keyboard is not showing, this will simply return the normal frame.

### presentAsKeyboardInView: {#presentAsKeyboardInView:}

."brush: obj-c"
    - (void)presentAsKeyboardInView:(UIView*)containingView;
    
Shows the view in a window at the bottom of the screen.
This will send a notification pretending that a keyboard is about to appear so that
observers who adjust their layout for the keyboard will also adjust for this view.

### dismissAsKeyboard: {#dismissAsKeyboard:}

."brush: obj-c"
    - (void)dismissAsKeyboard:(BOOL)animated;
    
Hides a view that was showing in a window at the bottom of the screen (via presentAsKeyboard).
This will send a notification pretending that a keyboard is about to disappear so that
observers who adjust their layout for the keyboard will also adjust for this view.

### viewController {#viewController}

."brush: obj-c"
    - (UIViewController*)viewController;
    
The view controller whose view contains this view.

UITableView {#UITableView}
===========

### indexView {#indexView}

."brush: obj-c"
    @property (nonatomic, readonly) UIView* indexView;
    
The view that contains the "index" along the right side of the table.

### tableCellMargin {#tableCellMargin}

."brush: obj-c"
    @property (nonatomic, readonly) CGFloat tableCellMargin;
    
Returns the margin used to inset table cells.
Grouped tables have a margin but plain tables don't.  This is useful in table cell
layout calculations where you don't want to hard-code the table style.

### scrollToTop: {#scrollToTop:}

."brush: obj-c"
    - (void)scrollToTop:(BOOL)animated;
    
Returns the margin used to inset table cells.
Grouped tables have a margin but plain tables don't.  This is useful in table cell
layout calculations where you don't want to hard-code the table style.

### scrollToBottom: {#scrollToBottom:}

."brush: obj-c"
    - (void)scrollToBottom:(BOOL)animated;
    
Returns the margin used to inset table cells.
Grouped tables have a margin but plain tables don't.  This is useful in table cell
layout calculations where you don't want to hard-code the table style.

### scrollToFirstRow: {#scrollToFirstRow:}

."brush: obj-c"
    - (void)scrollToFirstRow:(BOOL)animated;
    
Returns the margin used to inset table cells.
Grouped tables have a margin but plain tables don't.  This is useful in table cell
layout calculations where you don't want to hard-code the table style.

### scrollToLastRow: {#scrollToLastRow:}

."brush: obj-c"
    - (void)scrollToLastRow:(BOOL)animated;
    
Returns the margin used to inset table cells.
Grouped tables have a margin but plain tables don't.  This is useful in table cell
layout calculations where you don't want to hard-code the table style.

### scrollFirstResponderIntoView {#scrollFirstResponderIntoView}

."brush: obj-c"
    - (void)scrollFirstResponderIntoView;
    
Returns the margin used to inset table cells.
Grouped tables have a margin but plain tables don't.  This is useful in table cell
layout calculations where you don't want to hard-code the table style.

### touchRowAtIndexPath:animated: {#touchRowAtIndexPath:animated:}

."brush: obj-c"
    - (void)touchRowAtIndexPath:(NSIndexPath*)indexPath animated:(BOOL)animated;
    
Returns the margin used to inset table cells.
Grouped tables have a margin but plain tables don't.  This is useful in table cell
layout calculations where you don't want to hard-code the table style.

UIWebView {#UIWebView}
=========

### frameOfElement: {#frameOfElement:}

."brush: obj-c"
    - (CGRect)frameOfElement:(NSString*)query;
    
Gets the frame of a DOM element in the page.
@query A JavaScript expression that evaluates to a single DOM element.

UIToolbar {#UIToolbar}
=========

### itemWithTag: {#itemWithTag:}

."brush: obj-c"
    - (UIBarButtonItem*)itemWithTag:(NSInteger)tag;
    
Undocumented.

### replaceItemWithTag:withItem: {#replaceItemWithTag:withItem:}

."brush: obj-c"
    - (void)replaceItemWithTag:(NSInteger)tag withItem:(UIBarButtonItem*)item;
    
Undocumented.

UIWindow {#UIWindow}
========

### findFirstResponder {#findFirstResponder}

."brush: obj-c"
    - (UIView*)findFirstResponder;
    
Undocumented.

### findFirstResponderInView: {#findFirstResponderInView:}

."brush: obj-c"
    - (UIView*)findFirstResponderInView:(UIView*)topView;
    
Undocumented.

