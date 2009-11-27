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

### model {#model}

."brush: obj-c"
    @property (nonatomic, retain) id<TTModel> model;
    
Undocumented.

### modelError {#modelError}

."brush: obj-c"
    @property (nonatomic, retain) NSError* modelError;
    
An error that occurred while trying to load content.

Methods {#methods}
=======

### createModel {#createModel}

."brush: obj-c"
    - (void)createModel;
    
Creates the model that the controller manages.

### invalidateModel {#invalidateModel}

."brush: obj-c"
    - (void)invalidateModel;
    
Releases the current model and forces the creation of a new model.

### isModelCreated {#isModelCreated}

."brush: obj-c"
    - (BOOL)isModelCreated;
    
Indicates whether the model has been created.

### shouldLoad {#shouldLoad}

."brush: obj-c"
    - (BOOL)shouldLoad;
    
Indicates that data should be loaded from the model.

Do not call this directly.  Subclasses should implement this method.

### shouldReload {#shouldReload}

."brush: obj-c"
    - (BOOL)shouldReload;
    
Indicates that data should be reloaded from the model.

Do not call this directly.  Subclasses should implement this method.

### shouldLoadMore {#shouldLoadMore}

."brush: obj-c"
    - (BOOL)shouldLoadMore;
    
Indicates that more data should be loaded from the model.

Do not call this directly.  Subclasses should implement this method.

### canShowModel {#canShowModel}

."brush: obj-c"
    - (BOOL)canShowModel;
    
Tests if it is possible to show the model.

After a model has loaded, this method is called to test whether or not to set the model
has content that can be shown.  If you return NO, showEmpty: will be called, and if you
return YES, showModel: will be called.

### reload {#reload}

."brush: obj-c"
    - (void)reload;
    
Reloads data from the model.

### reloadIfNeeded {#reloadIfNeeded}

."brush: obj-c"
    - (void)reloadIfNeeded;
    
Reloads data from the model if it has become out of date.

### refresh {#refresh}

."brush: obj-c"
    - (void)refresh;
    
Refreshes the model state and loads new data if necessary.

### beginUpdates {#beginUpdates}

."brush: obj-c"
    - (void)beginUpdates;
    
Begins a multi-stage update.

You can call this method to make complicated updates more efficient, and to condense
multiple changes to your model into a single visual change.  Call endUpdate when you are done
to update the view with all of your changes.

### endUpdates {#endUpdates}

."brush: obj-c"
    - (void)endUpdates;
    
Ends a multi-stage model update and updates the view to reflect the model.

You can call this method to make complicated updates more efficient, and to condense
multiple changes to your model into a single visual change.

### invalidateView {#invalidateView}

."brush: obj-c"
    - (void)invalidateView;
    
Indicates that the model has changed and schedules the view to be updated to reflect it.

### updateView {#updateView}

."brush: obj-c"
    - (void)updateView;
    
Immediately creates, loads, and displays the model (if it was not already).

### didRefreshModel {#didRefreshModel}

."brush: obj-c"
    - (void)didRefreshModel;
    
Called when the model is refreshed.

Subclasses should override this function update parts of the view that may need to changed
when there is a new model, or something about the existing model changes. 

### willLoadModel {#willLoadModel}

."brush: obj-c"
    - (void)willLoadModel;
    
Called before the model is asked to load itself.

This is not called until after the view has loaded.  If your model starts loading before
the view is loaded, this will still be called, but not until after the view is loaded.
The default implementation of this method does nothing. Subclasses may override this method
to take an appropriate action.

### didLoadModel: {#didLoadModel:}

."brush: obj-c"
    - (void)didLoadModel:(BOOL)firstTime;
    
Called after the model has loaded, just before it is to be displayed.

This is not called until after the view has loaded.  If your model finishes loading before
the view is loaded, this will still be called, but not until after the view is loaded.
If you refresh a model which is already loaded, this will be called, but the firstTime
argument will be false.

The default implementation of this method does nothing. Subclasses may override this method
to take an appropriate action.

### didShowModel: {#didShowModel:}

."brush: obj-c"
    - (void)didShowModel:(BOOL)firstTime;
    
Called just after a model has been loaded and displayed.

The default implementation of this method does nothing. Subclasses may override this method
to take an appropriate action.

### showModel: {#showModel:}

."brush: obj-c"
    - (void)showModel:(BOOL)show;
    
Shows views to represent the loaded model's content.

The default implementation of this method does nothing. Subclasses may override this method
to take an appropriate action.

### showLoading: {#showLoading:}

."brush: obj-c"
    - (void)showLoading:(BOOL)show;
    
Shows views to represent the model loading.

The default implementation of this method does nothing. Subclasses may override this method
to take an appropriate action.

### showEmpty: {#showEmpty:}

."brush: obj-c"
    - (void)showEmpty:(BOOL)show;

Shows views to represent an empty model.

The default implementation of this method does nothing. Subclasses may override this method
to take an appropriate action.

### showError: {#showError:}

."brush: obj-c"
    - (void)showError:(BOOL)show;

Shows views to represent an error that occurred while loading the model.

