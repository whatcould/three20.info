<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Properties](#properties)
* [Methods](#methods)
* [TTScrollViewDelegate](#TTScrollViewDelegate)
* [TTScrollViewDataSource](#TTScrollViewDataSource)
</div>
<div class="clearfix"></div>

Properties {#properties}
==========

### delegate {#delegate}

."brush: obj-c"
    @property (nonatomic, assign) id<TTScrollViewDelegate> delegate;
    
Undocumented.

### dataSource {#dataSource}

."brush: obj-c"
    @property (nonatomic, assign) id<TTScrollViewDataSource> dataSource;
    
Undocumented.

### centerPageIndex {#centerPageIndex}

."brush: obj-c"
    @property (nonatomic) NSInteger centerPageIndex;
    
Undocumented.

### zoomed {#zoomed}

."brush: obj-c"
    @property (nonatomic, readonly) BOOL zoomed;
    
Undocumented.

### holding {#holding}

."brush: obj-c"
    @property (nonatomic, readonly) BOOL holding;
    
Undocumented.

### scrollEnabled {#scrollEnabled}

."brush: obj-c"
    @property (nonatomic) BOOL scrollEnabled;
    
Undocumented.

### zoomEnabled {#zoomEnabled}

."brush: obj-c"
    @property (nonatomic) BOOL zoomEnabled;
    
Undocumented.

### rotateEnabled {#rotateEnabled}

."brush: obj-c"
    @property (nonatomic) BOOL rotateEnabled;
    
Undocumented.

### pageSpacing {#pageSpacing}

."brush: obj-c"
    @property (nonatomic) CGFloat pageSpacing;
    
Undocumented.

### orientation {#orientation}

."brush: obj-c"
    @property (nonatomic) UIInterfaceOrientation orientation;
    
Undocumented.

### holdsAfterTouchingForInterval {#holdsAfterTouchingForInterval}

."brush: obj-c"
    @property (nonatomic) NSTimeInterval holdsAfterTouchingForInterval;
    
Undocumented.

### numberOfPages {#numberOfPages}

."brush: obj-c"
    @property (nonatomic, readonly) NSInteger numberOfPages;
    
Undocumented.

### centerPage {#centerPage}

."brush: obj-c"
    @property (nonatomic, readonly) UIView* centerPage;
    
Undocumented.

### visiblePages {#visiblePages}

."brush: obj-c"
    @property (nonatomic, readonly) NSDictionary* visiblePages;
    
A dictionary of visible pages keyed by the index of the page.

Methods {#methods}
=======

### setOrientation:animated: {#setOrientation:animated:}

."brush: obj-c"
    - (void)setOrientation:(UIInterfaceOrientation)orientation animated:(BOOL)animated;
    
A dictionary of visible pages keyed by the index of the page.

### dequeueReusablePage {#dequeueReusablePage}

."brush: obj-c"
    - (UIView*)dequeueReusablePage;
    
Gets a previously created page view that has been moved off screen and recycled.

### reloadData {#reloadData}

."brush: obj-c"
    - (void)reloadData;
    
Undocumented.

### pageAtIndex: {#pageAtIndex:}

."brush: obj-c"
    - (UIView*)pageAtIndex:(NSInteger)pageIndex;
    
Undocumented.

### zoomToFit {#zoomToFit}

."brush: obj-c"
    - (void)zoomToFit;
    
Undocumented.

### zoomToDistance: {#zoomToDistance:}

."brush: obj-c"
    - (void)zoomToDistance:(CGFloat)distance;
    
Undocumented.

### cancelTouches {#cancelTouches}

."brush: obj-c"
    - (void)cancelTouches;
    
Cancels any active touches and resets everything to an untouched state.

TTScrollViewDelegate {#TTScrollViewDelegate}
====================

### scrollView:didMoveToPageAtIndex: {#scrollView:didMoveToPageAtIndex:}

<div class="sectiontags" markdown="1">
* required
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollView:(TTScrollView*)scrollView didMoveToPageAtIndex:(NSInteger)pageIndex;
    
Undocumented.

### scrollViewWillRotate:toOrientation: {#scrollViewWillRotate:toOrientation:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollViewWillRotate:(TTScrollView*)scrollView
            toOrientation:(UIInterfaceOrientation)orientation;
    
Undocumented.

### scrollViewDidRotate: {#scrollViewDidRotate:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollViewDidRotate:(TTScrollView*)scrollView;
    
Undocumented.

### scrollViewWillBeginDragging: {#scrollViewWillBeginDragging:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollViewWillBeginDragging:(TTScrollView*)scrollView;
    
Undocumented.

### scrollViewDidEndDragging:willDecelerate: {#scrollViewDidEndDragging:willDecelerate:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollViewDidEndDragging:(TTScrollView*)scrollView willDecelerate:(BOOL)willDecelerate;
    
Undocumented.

### scrollViewDidEndDecelerating: {#scrollViewDidEndDecelerating:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollViewDidEndDecelerating:(TTScrollView*)scrollView;
    
Undocumented.

### scrollViewShouldZoom: {#scrollViewShouldZoom:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (BOOL)scrollViewShouldZoom:(TTScrollView*)scrollView;
    
Undocumented.

### scrollViewDidBeginZooming: {#scrollViewDidBeginZooming:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollViewDidBeginZooming:(TTScrollView*)scrollView;
    
Undocumented.

### scrollViewDidEndZooming: {#scrollViewDidEndZooming:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollViewDidEndZooming:(TTScrollView*)scrollView;
    
Undocumented.

### scrollView:touchedDown: {#scrollView:touchedDown:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollView:(TTScrollView*)scrollView touchedDown:(UITouch*)touch;
    
Undocumented.

### scrollView:touchedUpInside: {#scrollView:touchedUpInside:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollView:(TTScrollView*)scrollView touchedUpInside:(UITouch*)touch;
    
Undocumented.

### scrollView:tapped: {#scrollView:tapped:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollView:(TTScrollView*)scrollView tapped:(UITouch*)touch;
    
Undocumented.

### scrollViewDidBeginHolding: {#scrollViewDidBeginHolding:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollViewDidBeginHolding:(TTScrollView*)scrollView;
    
Undocumented.

### scrollViewDidEndHolding: {#scrollViewDidEndHolding:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)scrollViewDidEndHolding:(TTScrollView*)scrollView;
    
Undocumented.

### scrollView:shouldAutorotateToInterfaceOrientation: {#scrollView:shouldAutorotateToInterfaceOrientation:}

<div class="sectiontags" markdown="1">
* optional
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (BOOL)scrollView:(TTScrollView*)scrollView 
            shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation;
    
Undocumented.

TTScrollViewDataSource {#TTScrollViewDataSource}
======================

### numberOfPagesInScrollView: {#numberOfPagesInScrollView:}

<div class="sectiontags" markdown="1">
* required
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (NSInteger)numberOfPagesInScrollView:(TTScrollView*)scrollView;
    
Undocumented.

### scrollView:pageAtIndex: {#scrollView:pageAtIndex:}

<div class="sectiontags" markdown="1">
* required
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (UIView*)scrollView:(TTScrollView*)scrollView pageAtIndex:(NSInteger)pageIndex;
    
Gets a view to display for the page at the given index.
You do not need to position or size the view as that is done for you later.  You should
call dequeueReusablePage first, and only create a new view if it returns nil.

### scrollView:sizeOfPageAtIndex: {#scrollView:sizeOfPageAtIndex:}

<div class="sectiontags" markdown="1">
* required
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (CGSize)scrollView:(TTScrollView*)scrollView sizeOfPageAtIndex:(NSInteger)pageIndex;
    
Gets the natural size of the page. 
The actual width and height are not as important as the ratio between width and height.
This is used to determine how to 

