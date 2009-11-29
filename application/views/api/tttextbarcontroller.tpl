<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Properties](#properties)
* [Methods](#methods)
* [TTTextBarDelegate](#TTTextBarDelegate)
</div>
<div class="clearfix"></div>

Properties {#properties}
==========

### delegate {#delegate}

."brush: obj-c"
    @property (nonatomic, assign) id <TTTextBarDelegate> delegate;
    
Undocumented.

### textEditor {#textEditor}

."brush: obj-c"
    @property (nonatomic, readonly) TTTextEditor* textEditor;
    
Undocumented.

### postButton {#postButton}

."brush: obj-c"
    @property (nonatomic, readonly) TTButton* postButton;
    
Undocumented.

### footerBar {#footerBar}

."brush: obj-c"
    @property (nonatomic, retain) UIView* footerBar;
    
Undocumented.

Methods {#methods}
=======

### post {#post}

."brush: obj-c"
    - (void)post;
    
Posts the text to delegates, who have to actually do something with it.

### cancel {#cancel}

."brush: obj-c"
    - (void)cancel;
    
Cancels the controller, but confirms with the user if they have entered text.

### dismissWithResult:animated: {#dismissWithResult:animated:}

."brush: obj-c"
    - (void)dismissWithResult:(id)result animated:(BOOL)animated;
    
Dismisses the controller with a resulting that is sent to the delegate.

### failWithError: {#failWithError:}

."brush: obj-c"
    - (void)failWithError:(NSError*)error;
    
Notifies the user of an error and resets the editor to normal.

### willPostText: {#willPostText:}

."brush: obj-c"
    - (BOOL)willPostText:(NSString*)text;
    
The users has entered text and posted it.
Subclasses can implement this to handle the text before it is sent to the delegate. The
default returns NO.
@return YES if the controller should be dismissed immediately.

### titleForActivity {#titleForActivity}

."brush: obj-c"
    - (NSString*)titleForActivity;
    
Undocumented.

### titleForError: {#titleForError:}

."brush: obj-c"
    - (NSString*)titleForError:(NSError*)error;
    
Undocumented.

TTTextBarDelegate {#TTTextBarDelegate}
=================

### textBarDidBeginEditing: {#textBarDidBeginEditing:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)textBarDidBeginEditing:(TTTextBarController*)textBar;
    
Undocumented.

### textBarDidEndEditing: {#textBarDidEndEditing:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)textBarDidEndEditing:(TTTextBarController*)textBar;
    
Undocumented.

### textBar:willPostText: {#textBar:willPostText:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (BOOL)textBar:(TTTextBarController*)textBar willPostText:(NSString*)text;
    
The user has posted text and an animation is about to show the text return to its origin.
@return whether to dismiss the controller or wait for the user to call dismiss.

### textBar:didPostText:withResult: {#textBar:didPostText:withResult:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)textBar:(TTTextBarController*)textBar didPostText:(NSString*)text
            withResult:(id)result;
    
The text has been posted.

### textBarDidCancel: {#textBarDidCancel:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)textBarDidCancel:(TTTextBarController*)textBar;
    
The controller was cancelled before posting.

