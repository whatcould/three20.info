<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Properties](#properties)
* [Methods](#methods)
* [TTMessageControllerDelegate](#TTMessageControllerDelegate)
</div>
<div class="clearfix"></div>

Properties {#properties}
==========

### delegate {#delegate}

."brush: obj-c"
    @property (nonatomic, assign) id<TTMessageControllerDelegate> delegate;
    
Undocumented.

### dataSource {#dataSource}

."brush: obj-c"
    @property (nonatomic, retain) id<TTTableViewDataSource> dataSource;
    
Undocumented.

### fields {#fields}

."brush: obj-c"
    @property (nonatomic, retain) NSArray* fields;
    
Undocumented.

### subject {#subject}

."brush: obj-c"
    @property (nonatomic, retain) NSString* subject;
    
Undocumented.

### body {#body}

."brush: obj-c"
    @property (nonatomic, retain) NSString* body;
    
Undocumented.

### showsRecipientPicker {#showsRecipientPicker}

."brush: obj-c"
    @property (nonatomic) BOOL showsRecipientPicker;
    
Undocumented.

### isModified {#isModified}

."brush: obj-c"
    @property (nonatomic, readonly) BOOL isModified;
    
Undocumented.

Methods {#methods}
=======

### initWithRecipients: {#initWithRecipients:}

."brush: obj-c"
    - (id)initWithRecipients:(NSArray*)recipients;
    
Undocumented.

### addRecipient:forFieldAtIndex: {#addRecipient:forFieldAtIndex:}

."brush: obj-c"
    - (void)addRecipient:(id)recipient forFieldAtIndex:(NSUInteger)fieldIndex;
    
Undocumented.

### textForFieldAtIndex: {#textForFieldAtIndex:}

."brush: obj-c"
    - (NSString*)textForFieldAtIndex:(NSUInteger)fieldIndex;
    
Undocumented.

### setText:forFieldAtIndex: {#setText:forFieldAtIndex:}

."brush: obj-c"
    - (void)setText:(NSString*)text forFieldAtIndex:(NSUInteger)fieldIndex;
    
Undocumented.

### fieldHasValueAtIndex: {#fieldHasValueAtIndex:}

."brush: obj-c"
    - (BOOL)fieldHasValueAtIndex:(NSUInteger)fieldIndex;
    
Undocumented.

### viewForFieldAtIndex: {#viewForFieldAtIndex:}

."brush: obj-c"
    - (UIView*)viewForFieldAtIndex:(NSUInteger)fieldIndex;
    
Undocumented.

### showActivityView: {#showActivityView:}

."brush: obj-c"
    - (void)showActivityView:(BOOL)show;
    
Undocumented.

### titleForSending {#titleForSending}

."brush: obj-c"
    - (NSString*)titleForSending;
    
Undocumented.

### send {#send}

."brush: obj-c"
    - (void)send;
    
Tells the delegate to send the message.

### cancel: {#cancel:}

."brush: obj-c"
    - (void)cancel:(BOOL)confirmIfNecessary;
    
Cancel the message, but confirm first with the user if necessary.

### confirmCancellation {#confirmCancellation}

."brush: obj-c"
    - (void)confirmCancellation;
    
Confirms with the user that it is ok to cancel.

### messageWillSend: {#messageWillSend:}

."brush: obj-c"
    - (void)messageWillSend:(NSArray*)fields;
    
Undocumented.

### messageWillShowRecipientPicker {#messageWillShowRecipientPicker}

."brush: obj-c"
    - (void)messageWillShowRecipientPicker;
    
The user touched the recipient picker button.

### messageDidSend {#messageDidSend}

."brush: obj-c"
    - (void)messageDidSend;
    
Undocumented.

### messageShouldCancel {#messageShouldCancel}

."brush: obj-c"
    - (BOOL)messageShouldCancel;
    
Determines if the message should cancel without confirming with the user.

TTMessageControllerDelegate {#TTMessageControllerDelegate}
===========================

### composeController:didSendFields: {#composeController:didSendFields:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)composeController:(TTMessageController*)controller didSendFields:(NSArray*)fields;
    
Determines if the message should cancel without confirming with the user.

### composeControllerWillCancel: {#composeControllerWillCancel:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)composeControllerWillCancel:(TTMessageController*)controller;
    
Determines if the message should cancel without confirming with the user.

### composeControllerShowRecipientPicker: {#composeControllerShowRecipientPicker:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)composeControllerShowRecipientPicker:(TTMessageController*)controller;
    
Determines if the message should cancel without confirming with the user.
