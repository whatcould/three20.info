<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Methods](#methods)
* [TTRectangleShape](#TTRectangleShape)
* [TTRoundedRectangleShape](#TTRoundedRectangleShape)
* [TTRoundedRightArrowShape](#TTRoundedRightArrowShape)
* [TTRoundedLeftArrowShape](#TTRoundedLeftArrowShape)
* [TTSpeechBubbleShape](#TTSpeechBubbleShape)
</div>
<div class="clearfix"></div>

Methods {#methods}
=======

### openPath: {#openPath:}

."brush: obj-c"
    - (void)openPath:(CGRect)rect;
    
Undocumented.

### closePath: {#closePath:}

."brush: obj-c"
    - (void)closePath:(CGRect)rect;
    
Undocumented.

### addTopEdgeToPath:lightSource: {#addTopEdgeToPath:lightSource:}

."brush: obj-c"
    - (void)addTopEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;
    
Undocumented.

### addRightEdgeToPath:lightSource: {#addRightEdgeToPath:lightSource:}

."brush: obj-c"
    - (void)addRightEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;
    
Undocumented.

### addBottomEdgeToPath:lightSource: {#addBottomEdgeToPath:lightSource:}

."brush: obj-c"
    - (void)addBottomEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;
    
Undocumented.

### addLeftEdgeToPath:lightSource: {#addLeftEdgeToPath:lightSource:}

."brush: obj-c"
    - (void)addLeftEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;
    
Undocumented.

### addToPath: {#addToPath:}

."brush: obj-c"
    - (void)addToPath:(CGRect)rect;
    
Opens the path, adds all edges, and closes the path.

### addInverseToPath: {#addInverseToPath:}

."brush: obj-c"
    - (void)addInverseToPath:(CGRect)rect;
    
Undocumented.

### insetsForSize: {#insetsForSize:}

."brush: obj-c"
    - (UIEdgeInsets)insetsForSize:(CGSize)size;
    
Undocumented.

TTRectangleShape {#TTRectangleShape}
================

### shape {#shape}

."brush: obj-c"
    + (TTRectangleShape*)shape;
    
Undocumented.

TTRoundedRectangleShape {#TTRoundedRectangleShape}
=======================

### topLeftRadius {#topLeftRadius}

."brush: obj-c"
    @property (nonatomic) CGFloat topLeftRadius;
    
Undocumented.

### topRightRadius {#topRightRadius}

."brush: obj-c"
    @property (nonatomic) CGFloat topRightRadius;
    
Undocumented.

### bottomRightRadius {#bottomRightRadius}

."brush: obj-c"
    @property (nonatomic) CGFloat bottomRightRadius;
    
Undocumented.

### bottomLeftRadius {#bottomLeftRadius}

."brush: obj-c"
    @property (nonatomic) CGFloat bottomLeftRadius;
    
Undocumented.

### shapeWithRadius: {#shapeWithRadius:}

."brush: obj-c"
    + (TTRoundedRectangleShape*)shapeWithRadius:(CGFloat)radius;
    
Undocumented.

### shapeWithTopLeft:topRight:bottomRight:bottomLeft: {#shapeWithTopLeft:topRight:bottomRight:bottomLeft:}

."brush: obj-c"
    + (TTRoundedRectangleShape*)shapeWithTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight
          bottomRight:(CGFloat)bottomRight bottomLeft:(CGFloat)bottomLeft;
    
Undocumented.

TTRoundedRightArrowShape {#TTRoundedRightArrowShape}
========================

### radius {#radius}

."brush: obj-c"
    @property (nonatomic) CGFloat radius;
    
Undocumented.

### shapeWithRadius: {#shapeWithRadius:}

."brush: obj-c"
    + (TTRoundedRightArrowShape*)shapeWithRadius:(CGFloat)radius;
    
Undocumented.

TTRoundedLeftArrowShape {#TTRoundedLeftArrowShape}
=======================

### radius {#radius}

."brush: obj-c"
    @property (nonatomic) CGFloat radius;
    
Undocumented.

### shapeWithRadius: {#shapeWithRadius:}

."brush: obj-c"
    + (TTRoundedLeftArrowShape*)shapeWithRadius:(CGFloat)radius;
    
Undocumented.

TTSpeechBubbleShape {#TTSpeechBubbleShape}
===================

### radius {#radius}

."brush: obj-c"
    @property (nonatomic) CGFloat radius;
    
Undocumented.

### pointLocation {#pointLocation}

."brush: obj-c"
    @property (nonatomic) CGFloat pointLocation;
    
Undocumented.

### pointAngle {#pointAngle}

."brush: obj-c"
    @property (nonatomic) CGFloat pointAngle;
    
Undocumented.

### pointSize {#pointSize}

."brush: obj-c"
    @property (nonatomic) CGSize pointSize;
    
Undocumented.

### shapeWithRadius:pointLocation:pointAngle:pointSize: {#shapeWithRadius:pointLocation:pointAngle:pointSize:}

."brush: obj-c"
    + (TTSpeechBubbleShape*)shapeWithRadius:(CGFloat)radius pointLocation:(CGFloat)pointLocation
                            pointAngle:(CGFloat)pointAngle pointSize:(CGSize)pointSize;
    
Undocumented.

