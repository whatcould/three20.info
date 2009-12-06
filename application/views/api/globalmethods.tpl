<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Methods {#methods}
=======

### TTCreateNonRetainingArray {#TTCreateNonRetainingArray}

."brush: obj-c"
    NSMutableArray* TTCreateNonRetainingArray();
    
Creates a mutable array which does not retain references to the objects it contains.

### TTCreateNonRetainingDictionary {#TTCreateNonRetainingDictionary}

."brush: obj-c"
    NSMutableDictionary* TTCreateNonRetainingDictionary();
    
Creates a mutable dictionary which does not retain references to the values it contains.

### TTIsEmptyArray {#TTIsEmptyArray}

."brush: obj-c"
    BOOL TTIsEmptyArray(id object);
    
Tests if an object is an array which is empty.

### TTIsEmptySet {#TTIsEmptySet}

."brush: obj-c"
    BOOL TTIsEmptySet(id object);
    
Tests if an object is a set which is empty.

### TTIsEmptyString {#TTIsEmptyString}

."brush: obj-c"
    BOOL TTIsEmptyString(id object);
    
Tests if an object is a string which is empty.

### TTIsKeyboardVisible {#TTIsKeyboardVisible}

."brush: obj-c"
    BOOL TTIsKeyboardVisible();
    
Tests if the keyboard is visible.

### TTIsPhoneSupported {#TTIsPhoneSupported}

."brush: obj-c"
    BOOL TTIsPhoneSupported();
    
Tests if the device has phone capabilities.

### TTDeviceOrientation {#TTDeviceOrientation}

."brush: obj-c"
    UIDeviceOrientation TTDeviceOrientation();
    
Gets the current device orientation.

### TTInterfaceOrientation {#TTInterfaceOrientation}

."brush: obj-c"
    UIInterfaceOrientation TTInterfaceOrientation();
    
Gets the current interface orientation.

### TTIsSupportedOrientation {#TTIsSupportedOrientation}

."brush: obj-c"
    BOOL TTIsSupportedOrientation(UIInterfaceOrientation orientation);
    
Checks if the orientation is portrait, landscape left, or landscape right.
This helps to ignore upside down and flat orientations.

### TTRotateTransformForOrientation {#TTRotateTransformForOrientation}

."brush: obj-c"
    CGAffineTransform TTRotateTransformForOrientation(UIInterfaceOrientation orientation);
    
Gets the rotation transform for a given orientation.

### TTScreenBounds {#TTScreenBounds}

."brush: obj-c"
    CGRect TTScreenBounds();
    
Gets the bounds of the screen with device orientation factored in.

### TTApplicationFrame {#TTApplicationFrame}

."brush: obj-c"
    CGRect TTApplicationFrame();
    
Gets the application frame.

### TTNavigationFrame {#TTNavigationFrame}

."brush: obj-c"
    CGRect TTNavigationFrame();
    
Gets the application frame below the navigation bar.

### TTKeyboardNavigationFrame {#TTKeyboardNavigationFrame}

."brush: obj-c"
    CGRect TTKeyboardNavigationFrame();
    
Gets the application frame below the navigation bar and above the keyboard.

### TTToolbarNavigationFrame {#TTToolbarNavigationFrame}

."brush: obj-c"
    CGRect TTToolbarNavigationFrame();
    
Gets the application frame below the navigation bar and above a toolbar.

### TTStatusHeight {#TTStatusHeight}

."brush: obj-c"
    CGFloat TTStatusHeight();
    
The height of the area containing the status bar and possibly the in-call status bar.

### TTBarsHeight {#TTBarsHeight}

."brush: obj-c"
    CGFloat TTBarsHeight();
    
The height of the area containing the status bar and navigation bar.

### TTToolbarHeight {#TTToolbarHeight}

."brush: obj-c"
    CGFloat TTToolbarHeight();
    
The height of a toolbar.

### TTToolbarHeightForOrientation {#TTToolbarHeightForOrientation}

."brush: obj-c"
    CGFloat TTToolbarHeightForOrientation(UIInterfaceOrientation orientation);
    
The height of a toolbar.

### TTKeyboardHeight {#TTKeyboardHeight}

."brush: obj-c"
    CGFloat TTKeyboardHeight();
    
The height of the keyboard.

### TTKeyboardHeightForOrientation {#TTKeyboardHeightForOrientation}

."brush: obj-c"
    CGFloat TTKeyboardHeightForOrientation(UIInterfaceOrientation orientation);
    
The height of the keyboard.

### TTRectContract {#TTRectContract}

."brush: obj-c"
    CGRect TTRectContract(CGRect rect, CGFloat dx, CGFloat dy);
    
Returns a rectangle that is smaller or larger than the source rectangle.

### TTRectShift {#TTRectShift}

."brush: obj-c"
    CGRect TTRectShift(CGRect rect, CGFloat dx, CGFloat dy);
    
Returns a rectangle whose edges have been moved a distance and shortened by that distance.

### TTRectInset {#TTRectInset}

."brush: obj-c"
    CGRect TTRectInset(CGRect rect, UIEdgeInsets insets);
    
Returns a rectangle whose edges have been added to the insets.

### TTNetworkRequestStarted {#TTNetworkRequestStarted}

."brush: obj-c"
    void TTNetworkRequestStarted();
    
Increment the number of active network requests.
The status bar activity indicator will be spinning while there are active requests.

### TTNetworkRequestStopped {#TTNetworkRequestStopped}

."brush: obj-c"
    void TTNetworkRequestStopped();
    
Decrement the number of active network requests.
The status bar activity indicator will be spinning while there are active requests.

### TTAlert {#TTAlert}

."brush: obj-c"
    void TTAlert(NSString* message);
    
A convenient way to show a UIAlertView with a message;

### TTAlertError {#TTAlertError}

."brush: obj-c"
    void TTAlertError(NSString* message);
    
A convenient way to show a UIAlertView with a message;

### TTOSVersionIsAtLeast {#TTOSVersionIsAtLeast}

."brush: obj-c"
    BOOL TTOSVersionIsAtLeast(float version);
    
Checks if the link-time version of the OS is at least a certain version.

### TTCurrentLocale {#TTCurrentLocale}

."brush: obj-c"
    NSLocale* TTCurrentLocale();
    
Gets the current system locale chosen by the user.
This is necessary because [NSLocale currentLocale] always returns en_US.

### TTLocalizedString {#TTLocalizedString}

."brush: obj-c"
    NSString* TTLocalizedString(NSString* key, NSString* comment);
    
Returns a localized string from the Three20 bundle.

### TTDescriptionForError {#TTDescriptionForError}

."brush: obj-c"
    NSString* TTDescriptionForError(NSError* error);
    
Undocumented.

### TTFormatInteger {#TTFormatInteger}

."brush: obj-c"
    NSString* TTFormatInteger(NSInteger num);
    
Undocumented.

### TTIsBundleURL {#TTIsBundleURL}

."brush: obj-c"
    BOOL TTIsBundleURL(NSString* URL);
    
Undocumented.

### TTIsDocumentsURL {#TTIsDocumentsURL}

."brush: obj-c"
    BOOL TTIsDocumentsURL(NSString* URL);
    
Undocumented.

### TTPathForBundleResource {#TTPathForBundleResource}

."brush: obj-c"
    NSString* TTPathForBundleResource(NSString* relativePath);
    
Undocumented.

### TTPathForDocumentsResource {#TTPathForDocumentsResource}

."brush: obj-c"
    NSString* TTPathForDocumentsResource(NSString* relativePath);
    
Undocumented.

### TTSwapMethods {#TTSwapMethods}

."brush: obj-c"
    void TTSwapMethods(Class cls, SEL originalSel, SEL newSel);
    
Undocumented.

