<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Properties](#properties)
* [Methods](#methods)
* [TTPostControllerDelegate](#TTPostControllerDelegate)
</div>
<div class="clearfix"></div>

Properties {#properties}
==========

### delegate {#delegate}

."brush: obj-c"
    @property (nonatomic, assign) id<TTPostControllerDelegate> delegate;
    
Undocumented.

### result {#result}

."brush: obj-c"
    @property (nonatomic, retain) id result;
    
Undocumented.

### textView {#textView}

."brush: obj-c"
    @property (nonatomic, readonly) UITextView* textView;
    
Undocumented.

### navigatorBar {#navigatorBar}

."brush: obj-c"
    @property (nonatomic, readonly) UINavigationBar* navigatorBar;
    
Undocumented.

### originView {#originView}

."brush: obj-c"
    @property (nonatomic, retain) UIView* originView;
    
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

TTPostControllerDelegate {#TTPostControllerDelegate}
========================

### postController:willPostText: {#postController:willPostText:}

."brush: obj-c"
    - (BOOL)postController:(TTPostController*)postController
            willPostText:(NSString*)text;
    
The user has posted text and an animation is about to show the text return to its origin.
@return whether to dismiss the controller or wait for the user to call dismiss.

### postController:willAnimateTowards: {#postController:willAnimateTowards:}

."brush: obj-c"
    - (CGRect)postController:(TTPostController*)postController
              willAnimateTowards:(CGRect)rect;
    
The text will animate towards a rectangle.
@return the rect in screen coordinates where the text should animate towards.

### postController:didPostText:withResult: {#postController:didPostText:withResult:}

."brush: obj-c"
    - (void)postController:(TTPostController*)postController
            didPostText:(NSString*)text
            withResult:(id)result;
    
The text has been posted.

### postControllerDidCancel: {#postControllerDidCancel:}

."brush: obj-c"
    - (void)postControllerDidCancel:(TTPostController*)postController;
    
The controller was cancelled before posting.

