<?= $this->pageTitle() ?>
=========================

A view controller that displays an action sheet.

This class exists in order to allow action sheets to be displayed by TTNavigator, and gain
all the benefits of persistence and URL dispatch.

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Properties](#properties)
* [Methods](#methods)
* [TTActionSheetControllerDelegate](#TTActionSheetControllerDelegate)
</div>
<div class="clearfix"></div>

Properties {#properties}
==========

### delegate {#delegate}

."brush: obj-c"
    @property (nonatomic, assign) id<TTActionSheetControllerDelegate> delegate;
    
Undocumented.

### actionSheet {#actionSheet}

."brush: obj-c"
    @property (nonatomic, readonly) UIActionSheet* actionSheet;
    
Undocumented.

### userInfo {#userInfo}

."brush: obj-c"
    @property (nonatomic, retain) id userInfo;
    
Undocumented.

Methods {#methods}
=======

### initWithTitle: {#initWithTitle:}

."brush: obj-c"
    - (id)initWithTitle:(NSString*)title;
    
Undocumented.

### initWithTitle:delegate: {#initWithTitle:delegate:}

."brush: obj-c"
    - (id)initWithTitle:(NSString*)title delegate:(id)delegate;
    
Undocumented.

### addButtonWithTitle:URL: {#addButtonWithTitle:URL:}

."brush: obj-c"
    - (NSInteger)addButtonWithTitle:(NSString*)title URL:(NSString*)URL;
    
Undocumented.

### addCancelButtonWithTitle:URL: {#addCancelButtonWithTitle:URL:}

."brush: obj-c"
    - (NSInteger)addCancelButtonWithTitle:(NSString*)title URL:(NSString*)URL;
    
Undocumented.

### addDestructiveButtonWithTitle:URL: {#addDestructiveButtonWithTitle:URL:}

."brush: obj-c"
    - (NSInteger)addDestructiveButtonWithTitle:(NSString*)title URL:(NSString*)URL;
    
Undocumented.

### buttonURLAtIndex: {#buttonURLAtIndex:}

."brush: obj-c"
    - (NSString*)buttonURLAtIndex:(NSInteger)index;
    
Undocumented.

TTActionSheetControllerDelegate {#TTActionSheetControllerDelegate}
===============================

### actionSheetController:didDismissWithButtonIndex:URL: {#actionSheetController:didDismissWithButtonIndex:URL:}

."brush: obj-c"
    - (BOOL)actionSheetController:(TTActionSheetController*)controller
            didDismissWithButtonIndex:(NSInteger)buttonIndex URL:(NSString*)URL;
    
Undocumented.

