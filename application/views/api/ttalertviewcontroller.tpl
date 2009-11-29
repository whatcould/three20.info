<?= $this->pageTitle() ?>
=========================

A view controller that displays an alert view.

This class exists in order to allow alert views to be displayed by TTNavigator, and gain
all the benefits of persistence and URL dispatch.

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Properties](#properties)
* [Methods](#methods)
* [TTAlertViewControllerDelegate](#TTAlertViewControllerDelegate)
</div>
<div class="clearfix"></div>

Properties {#properties}
==========

### delegate {#delegate}

."brush: obj-c"
    @property (nonatomic, assign) id<TTAlertViewControllerDelegate> delegate;
    
Undocumented.

### alertView {#alertView}

."brush: obj-c"
    @property (nonatomic, readonly) UIAlertView* alertView;
    
Undocumented.

### userInfo {#userInfo}

."brush: obj-c"
    @property (nonatomic, retain) id userInfo;
    
Undocumented.

Methods {#methods}
=======

### initWithTitle:message: {#initWithTitle:message:}

."brush: obj-c"
    - (id)initWithTitle:(NSString*)title message:(NSString*)message;
    
Undocumented.

### initWithTitle:message:delegate: {#initWithTitle:message:delegate:}

."brush: obj-c"
    - (id)initWithTitle:(NSString*)title message:(NSString*)message delegate:(id)delegate;
    
Undocumented.

### addButtonWithTitle:URL: {#addButtonWithTitle:URL:}

."brush: obj-c"
    - (NSInteger)addButtonWithTitle:(NSString*)title URL:(NSString*)URL;
    
Undocumented.

### addCancelButtonWithTitle:URL: {#addCancelButtonWithTitle:URL:}

."brush: obj-c"
    - (NSInteger)addCancelButtonWithTitle:(NSString*)title URL:(NSString*)URL;
    
Undocumented.

### buttonURLAtIndex: {#buttonURLAtIndex:}

."brush: obj-c"
    - (NSString*)buttonURLAtIndex:(NSInteger)index;
    
Undocumented.

TTAlertViewControllerDelegate {#TTAlertViewControllerDelegate}
=============================

### alertViewController:didDismissWithButtonIndex:URL: {#alertViewController:didDismissWithButtonIndex:URL:}

."brush: obj-c"
    - (BOOL)alertViewController:(TTAlertViewController*)controller
            didDismissWithButtonIndex:(NSInteger)buttonIndex URL:(NSString*)URL;
    
Undocumented.

