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

### delegate {#delegate}

."brush: obj-c"
    @property (nonatomic, assign) id<TTWebControllerDelegate> delegate;
    
Undocumented.

### URL {#URL}

."brush: obj-c"
    @property (nonatomic, readonly) NSURL* URL;
    
Undocumented.

### headerView {#headerView}

."brush: obj-c"
    @property (nonatomic, retain) UIView* headerView;
    
Undocumented.

Methods {#methods}
=======

### openURL: {#openURL:}

."brush: obj-c"
    - (void)openURL:(NSURL*)URL;
    
Undocumented.

### openRequest: {#openRequest:}

."brush: obj-c"
    - (void)openRequest:(NSURLRequest*)request;
    
Undocumented.

