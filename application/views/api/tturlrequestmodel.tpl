<?= $this->pageTitle() ?>
=========================

An implementation of [TTModel](/api/TTModel) which is built to work with TTURLRequests.

If you use a TTURLRequestModel as the delegate of your TTURLRequests, it will automatically
manage many of the TTModel properties based on the state of your requests.

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

### loadedTime {#loadedTime}

."brush: obj-c"
    @property (nonatomic, retain) NSDate* loadedTime;

### cacheKey {#cacheKey}

."brush: obj-c"
    @property (nonatomic, copy) NSString* cacheKey;

### hasNoMore {#hasNoMore}

."brush: obj-c"
    @property (nonatomic) BOOL hasNoMore;

Methods {#methods}
=======

### reset {#reset}

."brush: obj-c"
    - (void)reset;
    
Resets the model to its original state before any data was loaded.
