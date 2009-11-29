<?= $this->pageTitle() ?>
=========================

A view controller which, when displayed modally, inserts its view over the parent controller.

Normally, displaying a modal view controller will completely hide the underlying view
controller, and even remove its view from the view hierarchy.  Popup view controllers allow
you to present a "modal" view which overlaps the parent view controller but does not
necessarily hide it.

This class does is meant to be subclassed, not used directly.

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Methods {#methods}
=======

### showInView:animated: {#showInView:animated:}

."brush: obj-c"
    - (void)showInView:(UIView*)view animated:(BOOL)animated;
    
Undocumented.

### dismissPopupViewControllerAnimated: {#dismissPopupViewControllerAnimated:}

."brush: obj-c"
    - (void)dismissPopupViewControllerAnimated:(BOOL)animated;
    
Undocumented.
