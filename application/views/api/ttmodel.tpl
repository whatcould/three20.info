<?= $this->pageTitle() ?>
=========================

A default implementation of TTModel does nothing other than appear to be loaded.

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Methods](#methods)
* [TTModel Protocol](#TTModelProtocol)
* [TTModelDelegate](#TTModelDelegate)
</div>
<div class="clearfix"></div>

Methods {#methods}
=======

### didStartLoad {#didStartLoad}

."brush: obj-c"
    - (void)didStartLoad;
    
Notifies delegates that the model started to load.

### didFinishLoad {#didFinishLoad}

."brush: obj-c"
    - (void)didFinishLoad;
    
Notifies delegates that the model finished loading

### didFailLoadWithError: {#didFailLoadWithError:}

."brush: obj-c"
    - (void)didFailLoadWithError:(NSError*)error;
    
Notifies delegates that the model failed to load.

### didCancelLoad {#didCancelLoad}

."brush: obj-c"
    - (void)didCancelLoad;
    
Notifies delegates that the model canceled its load.

### beginUpdates {#beginUpdates}

."brush: obj-c"
    - (void)beginUpdates;
    
Notifies delegates that the model has begun making multiple updates.

### endUpdates {#endUpdates}

."brush: obj-c"
    - (void)endUpdates;
    
Notifies delegates that the model has completed its updates.

### didUpdateObject:atIndexPath: {#didUpdateObject:atIndexPath:}

."brush: obj-c"
    - (void)didUpdateObject:(id)object atIndexPath:(NSIndexPath*)indexPath;
    
Notifies delegates that an object was updated.

### didInsertObject:atIndexPath: {#didInsertObject:atIndexPath:}

."brush: obj-c"
    - (void)didInsertObject:(id)object atIndexPath:(NSIndexPath*)indexPath;
    
Notifies delegates that an object was inserted.

### didDeleteObject:atIndexPath: {#didDeleteObject:atIndexPath:}

."brush: obj-c"
    - (void)didDeleteObject:(id)object atIndexPath:(NSIndexPath*)indexPath;
    
Notifies delegates that an object was deleted.

### didChange {#didChange}

."brush: obj-c"
    - (void)didChange;
    
Notifies delegates that the model changed in some fundamental way.

TTModel Protocol {#TTModelProtocol}
================

TTModel describes the state of an object that can be loaded from a remote source.

By implementing this protocol, you can communicate to the user the state of network
activity in an object.

### delegates {#delegates}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (NSMutableArray*)delegates;
    
An array of objects that conform to the [TTModelDelegate](#TTModelDelegate) protocol.

### isLoaded {#isLoaded}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (BOOL)isLoaded;
    
Indicates that the data has been loaded.

### isLoading {#isLoading}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (BOOL)isLoading;
    
Indicates that the data is in the process of loading.

### isLoadingMore {#isLoadingMore}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (BOOL)isLoadingMore;
    
Indicates that the data is in the process of loading additional data.

### -(BOOL)isOutdated {#-(BOOL)isOutdated}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    -(BOOL)isOutdated;
    
Indicates that the model is of date and should be reloaded as soon as possible.

### load:more: {#load:more:}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more;
    
Loads the model.

### cancel {#cancel}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)cancel;
    
Cancels a load that is in progress.

### invalidate: {#invalidate:}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)invalidate:(BOOL)erase;
    
Invalidates data stored in the cache or optionally erases it.

TTModelDelegate {#TTModelDelegate}
===============

### modelDidStartLoad:model {#modelDidStartLoad:model}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)modelDidStartLoad:(id<TTModel>)model;
    
Undocumented.

### modelDidFinishLoad:model {#modelDidFinishLoad:model}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)modelDidFinishLoad:(id<TTModel>)model;
    
Undocumented.

### model:modeldidFailLoadWithError: {#model:modeldidFailLoadWithError:}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)model:(id<TTModel>)model didFailLoadWithError:(NSError*)error;
    
Undocumented.

### modelDidCancelLoad:model {#modelDidCancelLoad:model}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)modelDidCancelLoad:(id<TTModel>)model;
    
Undocumented.

### modelDidChange:model {#modelDidChange:model}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)modelDidChange:(id<TTModel>)model;
    
Informs the delegate that the model has changed in some fundamental way.
The change is not described specifically, so the delegate must assume that the entire
contents of the model may have changed, and react almost as if it was given a new model.

### model:didUpdateObject:atIndexPath: {#model:didUpdateObject:atIndexPath:}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)model:(id<TTModel>)model didUpdateObject:(id)object atIndexPath:(NSIndexPath*)indexPath;
    
Undocumented.

### model:didInsertObject:atIndexPath: {#model:didInsertObject:atIndexPath:}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)model:(id<TTModel>)model didInsertObject:(id)object atIndexPath:(NSIndexPath*)indexPath;
    
Undocumented.

### model:didDeleteObject:atIndexPath: {#model:didDeleteObject:atIndexPath:}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)model:(id<TTModel>)model didDeleteObject:(id)object atIndexPath:(NSIndexPath*)indexPath;
    
Undocumented.

### modelDidBeginUpdates:model {#modelDidBeginUpdates:model}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)modelDidBeginUpdates:(id<TTModel>)model;
    
Informs the delegate that the model is about to begin a multi-stage update.
Models should use this method to condense multiple updates into a single visible update.
This avoids having the view update multiple times for each change.  Instead, the user will
only see the end result of all of your changes when you call modelDidEndUpdates.

### modelDidEndUpdates:model {#modelDidEndUpdates:model}

<div class="sectiontags" markdown="1">
* Optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)modelDidEndUpdates:(id<TTModel>)model;
    
Informs the delegate that the model has completed a multi-stage update.
The exact nature of the change is not specified, so the receiver should investigate the
new state of the model by examining its properties.
