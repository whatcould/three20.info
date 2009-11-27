<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Properties](#properties)
* [Methods](#methods)
* [TTImageViewDelegate](#TTImageViewDelegate)
</div>
<div class="clearfix"></div>

Properties {#properties}
==========

### delegate {#delegate}

."brush: obj-c"
    @property (nonatomic, assign) id<TTImageViewDelegate> delegate;
    
Undocumented.

### URL {#URL}

<div class="sectiontags" markdown="1">
* Default: nil
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @property (nonatomic, copy) NSString* URL;
    
Undocumented.

### image {#image}

<div class="sectiontags" markdown="1">
* Default: nil
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @property (nonatomic, retain) UIImage* image;
    
Undocumented.

### defaultImage {#defaultImage}

<div class="sectiontags" markdown="1">
* Default: nil
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @property (nonatomic, retain) UIImage* defaultImage;
    
Undocumented.

### autoresizesToImage {#autoresizesToImage}

<div class="sectiontags" markdown="1">
* Default: NO
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @property (nonatomic) BOOL autoresizesToImage;
    
Undocumented.

### isLoading {#isLoading}

."brush: obj-c"
    @property (nonatomic, readonly) BOOL isLoading;
    
Undocumented.

### isLoaded {#isLoaded}

."brush: obj-c"
    @property (nonatomic, readonly) BOOL isLoaded;
    
Undocumented.

Methods {#methods}
=======

### reload {#reload}

."brush: obj-c"
    - (void)reload;
    
Undocumented.

### stopLoading {#stopLoading}

."brush: obj-c"
    - (void)stopLoading;
    
Undocumented.

### imageViewDidStartLoad {#imageViewDidStartLoad}

."brush: obj-c"
    - (void)imageViewDidStartLoad;
    
Undocumented.

### imageViewDidLoadImage: {#imageViewDidLoadImage:}

."brush: obj-c"
    - (void)imageViewDidLoadImage:(UIImage*)image;
    
Undocumented.

### imageViewDidFailLoadWithError: {#imageViewDidFailLoadWithError:}

."brush: obj-c"
    - (void)imageViewDidFailLoadWithError:(NSError*)error;
    
Undocumented.

TTImageViewDelegate {#TTImageViewDelegate}
===================

### imageView:didLoadImage: {#imageView:didLoadImage:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)imageView:(TTImageView*)imageView didLoadImage:(UIImage*)image;
    
Undocumented.

### imageViewDidStartLoad: {#imageViewDidStartLoad:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)imageViewDidStartLoad:(TTImageView*)imageView;
    
Undocumented.

### imageView:didFailLoadWithError: {#imageView:didFailLoadWithError:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)imageView:(TTImageView*)imageView didFailLoadWithError:(NSError*)error;
    
Undocumented.

