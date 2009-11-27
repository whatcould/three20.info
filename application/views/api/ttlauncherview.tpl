<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Properties](#properties)
* [Methods](#methods)
* [TTLauncherViewDelegate](#TTLauncherViewDelegate)
</div>
<div class="clearfix"></div>

Properties {#properties}
==========

### delegate {#delegate}

."brush: obj-c"
    @property (nonatomic, assign) id<TTLauncherViewDelegate> delegate;
    
Undocumented.

### pages {#pages}

."brush: obj-c"
    @property (nonatomic, copy) NSArray* pages;
    
Undocumented.

### columnCount {#columnCount}

."brush: obj-c"
    @property (nonatomic) NSInteger columnCount;
    
Undocumented.

### rowCount {#rowCount}

."brush: obj-c"
    @property (nonatomic, readonly) NSInteger rowCount;
    
Undocumented.

### currentPageIndex {#currentPageIndex}

."brush: obj-c"
    @property (nonatomic) NSInteger currentPageIndex;
    
Undocumented.

### prompt {#prompt}

."brush: obj-c"
    @property (nonatomic, copy) NSString* prompt;
    
Undocumented.

### editing {#editing}

."brush: obj-c"
    @property (nonatomic, readonly) BOOL editing;
    
Undocumented.

Methods {#methods}
=======

### addItem:animated: {#addItem:animated:}

."brush: obj-c"
    - (void)addItem:(TTLauncherItem*)item animated:(BOOL)animated;
    
Undocumented.

### removeItem:animated: {#removeItem:animated:}

."brush: obj-c"
    - (void)removeItem:(TTLauncherItem*)item animated:(BOOL)animated;
    
Undocumented.

### itemWithURL: {#itemWithURL:}

."brush: obj-c"
    - (TTLauncherItem*)itemWithURL:(NSString*)URL;
    
Undocumented.

### indexPathOfItem: {#indexPathOfItem:}

."brush: obj-c"
    - (NSIndexPath*)indexPathOfItem:(TTLauncherItem*)item;
    
Undocumented.

### scrollToItem:animated: {#scrollToItem:animated:}

."brush: obj-c"
    - (void)scrollToItem:(TTLauncherItem*)item animated:(BOOL)animated;
    
Undocumented.

### beginEditing {#beginEditing}

."brush: obj-c"
    - (void)beginEditing;
    
Undocumented.

### endEditing {#endEditing}

."brush: obj-c"
    - (void)endEditing;
    
Undocumented.

TTLauncherViewDelegate {#TTLauncherViewDelegate}
======================

### launcherView:didAddItem: {#launcherView:didAddItem:}

."brush: obj-c"
    - (void)launcherView:(TTLauncherView*)launcher didAddItem:(TTLauncherItem*)item;
    
Undocumented.

### launcherView:didRemoveItem: {#launcherView:didRemoveItem:}

."brush: obj-c"
    - (void)launcherView:(TTLauncherView*)launcher didRemoveItem:(TTLauncherItem*)item;
    
Undocumented.

### launcherView:didMoveItem: {#launcherView:didMoveItem:}

."brush: obj-c"
    - (void)launcherView:(TTLauncherView*)launcher didMoveItem:(TTLauncherItem*)item;
    
Undocumented.

### launcherView:didSelectItem: {#launcherView:didSelectItem:}

."brush: obj-c"
    - (void)launcherView:(TTLauncherView*)launcher didSelectItem:(TTLauncherItem*)item;
    
Undocumented.

### launcherViewDidBeginEditing: {#launcherViewDidBeginEditing:}

."brush: obj-c"
    - (void)launcherViewDidBeginEditing:(TTLauncherView*)launcher;
    
Undocumented.

### launcherViewDidEndEditing: {#launcherViewDidEndEditing:}

."brush: obj-c"
    - (void)launcherViewDidEndEditing:(TTLauncherView*)launcher;
    
Undocumented.

