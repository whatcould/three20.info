<?= $this->pageTitle() ?>
=========================

Know what you're looking for? <input type="text" id="apilookup" placeholder="Instant API Lookup" />

Table of Contents
-----------------

<div class="toc" markdown="1">
* [Examples](#examples)
* [Properties](#properties)
* [Methods](#methods)
* [TTStyleContext](#TTStyleContext)
* [TTContentStyle](#TTContentStyle)
* [TTPartStyle](#TTPartStyle)
* [TTShapeStyle](#TTShapeStyle)
* [TTInsetStyle](#TTInsetStyle)
* [TTBoxStyle](#TTBoxStyle)
* [TTTextStyle](#TTTextStyle)
* [TTImageStyle](#TTImageStyle)
* [TTMaskStyle](#TTMaskStyle)
* [TTBlendStyle](#TTBlendStyle)
* [TTSolidFillStyle](#TTSolidFillStyle)
* [TTLinearGradientFillStyle](#TTLinearGradientFillStyle)
* [TTReflectiveFillStyle](#TTReflectiveFillStyle)
* [TTShadowStyle](#TTShadowStyle)
* [TTInnerShadowStyle](#TTInnerShadowStyle)
* [TTSolidBorderStyle](#TTSolidBorderStyle)
* [TTHighlightBorderStyle](#TTHighlightBorderStyle)
* [TTFourBorderStyle](#TTFourBorderStyle)
* [TTBevelBorderStyle](#TTBevelBorderStyle)
* [TTLinearGradientBorderStyle](#TTLinearGradientBorderStyle)
* [TTStyleDelegate](#TTStyleDelegate)
</div>
<div class="clearfix"></div>


Examples {#examples}
========

."brush: obj-c"
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:4.5] next:
    [TTShadowStyle styleWithColor:RGBCOLOR(255,255,255)
                   blur:1
                   offset:CGSizeMake(0, 1) next:
    [TTReflectiveFillStyle styleWithColor:darkBlue next:
    [TTBevelBorderStyle styleWithHighlight:[darkBlue shadow]
                        shadow:[darkBlue multiplyHue:1 saturation:0.5 value:0.5]
                        width:1
                        lightSource:270 next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(0, -1, 0, -1) next:
    [TTBevelBorderStyle styleWithHighlight:nil shadow:RGBACOLOR(0,0,0,0.15)
                        width:1
                        lightSource:270 next:nil]]]]]]

<div class="image darker" markdown=1>![Toolbar Button](/gfx/api/style/toolbarbutton.png 144x48)</div>

."brush: obj-c"
    [TTShapeStyle styleWithShape:[TTSpeechBubbleShape shapeWithRadius:5
                                                      pointLocation:60
                                                      pointAngle:90
                                                      pointSize:CGSizeMake(20,10)] next:
    [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:
    [TTSolidBorderStyle styleWithColor:black width:1 next:nil]]]

<div class="image darker" markdown=1>![Speech Bubble](/gfx/api/style/speechbubble.png 144x48)</div>

."brush: obj-c"
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:6] next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(1, 1, 2, 1) next:
    [TTReflectiveFillStyle styleWithColor:RGBCOLOR(170, 1, 2)
                           withBottomHighlight:YES next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(-1, -1, -2, -1) next:
    [TTHighlightBorderStyle styleWithColor:RGBCOLOR(113, 115, 117)
                            highlightColor:RGBACOLOR(255, 255, 255, 0.4)
                            width:1 next:
    [TTPartStyle styleWithName:@"image" style:TTSTYLE(buttonImage:) next:nil]]]]]]

<div class="image darker" markdown=1>![Delete Button](/gfx/api/style/deletebutton.png 144x48)</div>


Properties {#properties}
==========

### next {#next}

."brush: obj-c"
    @property (nonatomic, retain) TTStyle* next;
    
Undocumented.

Methods {#methods}
=======

### initWithNext: {#initWithNext:}

."brush: obj-c"
    - (id)initWithNext:(TTStyle*)next;
    
Undocumented.

### next: {#next:}

."brush: obj-c"
    - (TTStyle*)next:(TTStyle*)next;
    
Undocumented.

### draw: {#draw:}

."brush: obj-c"
    - (void)draw:(TTStyleContext*)context;
    
Undocumented.

### addToInsets:forSize: {#addToInsets:forSize:}

."brush: obj-c"
    - (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size;
    
Undocumented.

### addToSize:context: {#addToSize:context:}

."brush: obj-c"
    - (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context;
    
Undocumented.

### addStyle: {#addStyle:}

."brush: obj-c"
    - (void)addStyle:(TTStyle*)style;
    
Undocumented.

### firstStyleOfClass: {#firstStyleOfClass:}

."brush: obj-c"
    - (id)firstStyleOfClass:(Class)cls;
    
Undocumented.

### styleForPart: {#styleForPart:}

."brush: obj-c"
    - (id)styleForPart:(NSString*)name;
    
Undocumented.

TTStyleContext {#TTStyleContext}
==============

### delegate {#delegate}

."brush: obj-c"
    @property (nonatomic, assign) id<TTStyleDelegate> delegate;
    
Undocumented.

### frame {#frame}

."brush: obj-c"
    @property (nonatomic) CGRect frame;
    
Undocumented.

### contentFrame {#contentFrame}

."brush: obj-c"
    @property (nonatomic) CGRect contentFrame;
    
Undocumented.

### shape {#shape}

."brush: obj-c"
    @property (nonatomic, retain) TTShape* shape;

Undocumented. See [TTShape](/api/TTShape) for more details.

### font {#font}

."brush: obj-c"
    @property (nonatomic, retain) UIFont* font;
    
Undocumented.

### didDrawContent {#didDrawContent}

."brush: obj-c"
    @property (nonatomic) BOOL didDrawContent;
    
Undocumented.

TTContentStyle {#TTContentStyle}
==============

### styleWithNext: {#styleWithNext:}

."brush: obj-c"
    + (TTContentStyle*)styleWithNext:(TTStyle*)next;
    
Undocumented.

TTPartStyle {#TTPartStyle}
===========

### name {#name}

."brush: obj-c"
    @property (nonatomic, copy) NSString* name;
    
Undocumented.

### style {#style}

."brush: obj-c"
    @property (nonatomic, retain) TTStyle* style;
    
Undocumented.

### styleWithName:style:next: {#styleWithName:style:next:}

."brush: obj-c"
    + (TTPartStyle*)styleWithName:(NSString*)name style:(TTStyle*)style next:(TTStyle*)next;
    
Undocumented.

### drawPart: {#drawPart:}

."brush: obj-c"
    - (void)drawPart:(TTStyleContext*)context;
    
Undocumented.

TTShapeStyle {#TTShapeStyle}
============

."brush: obj-c"
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:10] next:
    [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:
    [TTSolidBorderStyle styleWithColor:black width:1 next:nil]]]

<div class="image darker" markdown=1>![TTRoundedRectangleShape](/gfx/api/style/TTRoundedRectangleShape.png 144x48)</div>

."brush: obj-c"
    [TTShapeStyle styleWithShape:[TTRoundedRightArrowShape shapeWithRadius:10] next:
    [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:
    [TTSolidBorderStyle styleWithColor:black width:1 next:nil]]]

<div class="image darker" markdown=1>![TTRoundedRightArrowShape](/gfx/api/style/TTRoundedRightArrowShape.png 144x48)</div>

### shape {#shape}

."brush: obj-c"
    @property (nonatomic, retain) TTShape* shape;
    
Causes all layers going forward to use a particular shape.

See [TTShape](/api/TTShape) for more details.

### styleWithShape:next: {#styleWithShape:next:}

."brush: obj-c"
    + (TTShapeStyle*)styleWithShape:(TTShape*)shape next:(TTStyle*)next;
    
Causes all layers going forward to use a particular shape.

TTInsetStyle {#TTInsetStyle}
============

."brush: obj-c"
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:10] next:
    [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:
    [TTSolidBorderStyle styleWithColor:black width:1 next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(5, 5, 5, 5) next:
    [TTSolidBorderStyle styleWithColor:blue width:1 next:nil]]]]]

<div class="image darker" markdown=1>![TTInsetStyle](/gfx/api/style/TTInsetStyle.png 144x48)</div>

### inset {#inset}

."brush: obj-c"
    @property (nonatomic) UIEdgeInsets inset;
    
Undocumented.

### styleWithInset:next: {#styleWithInset:next:}

."brush: obj-c"
    + (TTInsetStyle*)styleWithInset:(UIEdgeInsets)inset next:(TTStyle*)next;
    
Undocumented.

TTBoxStyle {#TTBoxStyle}
==========

### margin {#margin}

."brush: obj-c"
    @property (nonatomic) UIEdgeInsets margin;
    
Undocumented.

### padding {#padding}

."brush: obj-c"
    @property (nonatomic) UIEdgeInsets padding;
    
Undocumented.

### minSize {#minSize}

."brush: obj-c"
    @property (nonatomic) CGSize minSize;
    
Undocumented.

### position {#position}

."brush: obj-c"
    @property (nonatomic) TTPosition position;
    
Undocumented.

### styleWithMargin:next: {#styleWithMargin:next:}

."brush: obj-c"
    + (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin next:(TTStyle*)next;
    
Undocumented.

### styleWithPadding:next: {#styleWithPadding:next:}

."brush: obj-c"
    + (TTBoxStyle*)styleWithPadding:(UIEdgeInsets)padding next:(TTStyle*)next;
    
Undocumented.

### styleWithFloats:next: {#styleWithFloats:next:}

."brush: obj-c"
    + (TTBoxStyle*)styleWithFloats:(TTPosition)position next:(TTStyle*)next;
    
Undocumented.

### styleWithMargin:padding:next: {#styleWithMargin:padding:next:}

."brush: obj-c"
    + (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
                   next:(TTStyle*)next;
    
Undocumented.

### styleWithMargin:padding:minSize:position:next: {#styleWithMargin:padding:minSize:position:next:}

."brush: obj-c"
    + (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
                   minSize:(CGSize)minSize position:(TTPosition)position next:(TTStyle*)next;
    
Undocumented.

TTTextStyle {#TTTextStyle}
===========

### font {#font}

."brush: obj-c"
    @property (nonatomic, retain) UIFont* font;
    
Undocumented.

### color {#color}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* color;
    
Undocumented.

### shadowColor {#shadowColor}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* shadowColor;
    
Undocumented.

### minimumFontSize {#minimumFontSize}

."brush: obj-c"
    @property (nonatomic) CGFloat minimumFontSize;
    
Undocumented.

### shadowOffset {#shadowOffset}

."brush: obj-c"
    @property (nonatomic) CGSize shadowOffset;
    
Undocumented.

### numberOfLines {#numberOfLines}

."brush: obj-c"
    @property (nonatomic) NSInteger numberOfLines;
    
Undocumented.

### textAlignment {#textAlignment}

."brush: obj-c"
    @property (nonatomic) UITextAlignment textAlignment;
    
Undocumented.

### verticalAlignment {#verticalAlignment}

."brush: obj-c"
    @property (nonatomic) UIControlContentVerticalAlignment verticalAlignment;
    
Undocumented.

### lineBreakMode {#lineBreakMode}

."brush: obj-c"
    @property (nonatomic) UILineBreakMode lineBreakMode;
    
Undocumented.

### styleWithFont:next: {#styleWithFont:next:}

."brush: obj-c"
    + (TTTextStyle*)styleWithFont:(UIFont*)font next:(TTStyle*)next;
    
Undocumented.

### styleWithColor:next: {#styleWithColor:next:}

."brush: obj-c"
    + (TTTextStyle*)styleWithColor:(UIColor*)color next:(TTStyle*)next;
    
Undocumented.

### styleWithFont:color:next: {#styleWithFont:color:next:}

."brush: obj-c"
    + (TTTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color next:(TTStyle*)next;
    
Undocumented.

### styleWithFont:color:textAlignment:next: {#styleWithFont:color:textAlignment:next:}

."brush: obj-c"
    + (TTTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
                    textAlignment:(UITextAlignment)textAlignment next:(TTStyle*)next;
    
Undocumented.

### styleWithFont:color:shadowColor:shadowOffset:next: {#styleWithFont:color:shadowColor:shadowOffset:next:}

."brush: obj-c"
    + (TTTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
                    shadowColor:(UIColor*)shadowColor shadowOffset:(CGSize)shadowOffset
                    next:(TTStyle*)next;
    
Undocumented.

### styleWithFont:color:minimumFontSize:shadowColor:shadowOffset:next: {#styleWithFont:color:minimumFontSize:shadowColor:shadowOffset:next:}

."brush: obj-c"
    + (TTTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
                    minimumFontSize:(CGFloat)minimumFontSize
                    shadowColor:(UIColor*)shadowColor shadowOffset:(CGSize)shadowOffset
                    next:(TTStyle*)next;
    
Undocumented.

### styleWithFont:color:minimumFontSize:shadowColor:shadowOffset:textAlignment:verticalAlignment:lineBreakMode:numberOfLines:next: {#styleWithFont:color:minimumFontSize:shadowColor:shadowOffset:textAlignment:verticalAlignment:lineBreakMode:numberOfLines:next:}

."brush: obj-c"
    + (TTTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
                    minimumFontSize:(CGFloat)minimumFontSize
                    shadowColor:(UIColor*)shadowColor shadowOffset:(CGSize)shadowOffset
                    textAlignment:(UITextAlignment)textAlignment
                    verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                    lineBreakMode:(UILineBreakMode)lineBreakMode numberOfLines:(NSInteger)numberOfLines
                    next:(TTStyle*)next;
    
Undocumented.

TTImageStyle {#TTImageStyle}
============

### imageURL {#imageURL}

."brush: obj-c"
    @property (nonatomic, copy) NSString* imageURL;
    
Undocumented.

### image {#image}

."brush: obj-c"
    @property (nonatomic, retain) UIImage* image;
    
Undocumented.

### defaultImage {#defaultImage}

."brush: obj-c"
    @property (nonatomic, retain) UIImage* defaultImage;
    
Undocumented.

### size {#size}

."brush: obj-c"
    @property (nonatomic) CGSize size;
    
Undocumented.

### contentMode {#contentMode}

."brush: obj-c"
    @property (nonatomic) UIViewContentMode contentMode;
    
Undocumented.

### styleWithImageURL:next: {#styleWithImageURL:next:}

."brush: obj-c"
    + (TTImageStyle*)styleWithImageURL:(NSString*)imageURL next:(TTStyle*)next;
    
Undocumented.

### styleWithImageURL:defaultImage:next: {#styleWithImageURL:defaultImage:next:}

."brush: obj-c"
    + (TTImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(UIImage*)defaultImage
                     next:(TTStyle*)next;
    
Undocumented.

### styleWithImageURL:defaultImage:contentMode:size:next: {#styleWithImageURL:defaultImage:contentMode:size:next:}

."brush: obj-c"
    + (TTImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(UIImage*)defaultImage
                     contentMode:(UIViewContentMode)contentMode
                     size:(CGSize)size next:(TTStyle*)next;
    
Undocumented.

### styleWithImage:next: {#styleWithImage:next:}

."brush: obj-c"
    + (TTImageStyle*)styleWithImage:(UIImage*)image next:(TTStyle*)next;
    
Undocumented.

### styleWithImage:defaultImage:next: {#styleWithImage:defaultImage:next:}

."brush: obj-c"
    + (TTImageStyle*)styleWithImage:(UIImage*)image defaultImage:(UIImage*)defaultImage
                     next:(TTStyle*)next;
    
Undocumented.

### styleWithImage:defaultImage:contentMode:size:next: {#styleWithImage:defaultImage:contentMode:size:next:}

."brush: obj-c"
    + (TTImageStyle*)styleWithImage:(UIImage*)image defaultImage:(UIImage*)defaultImage
                     contentMode:(UIViewContentMode)contentMode
                     size:(CGSize)size next:(TTStyle*)next;
    
Undocumented.

TTMaskStyle {#TTMaskStyle}
===========

### mask {#mask}

."brush: obj-c"
    @property (nonatomic, retain) UIImage* mask;
    
Undocumented.

### styleWithMask:next: {#styleWithMask:next:}

."brush: obj-c"
    + (TTMaskStyle*)styleWithMask:(UIImage*)mask next:(TTStyle*)next;
    
Undocumented.

TTBlendStyle {#TTBlendStyle}
============

### blendMode {#blendMode}

."brush: obj-c"
    @property (nonatomic) CGBlendMode blendMode;
    
Undocumented.

### styleWithBlend:next: {#styleWithBlend:next:}

."brush: obj-c"
    + (TTBlendStyle*)styleWithBlend:(CGBlendMode)blendMode next:(TTStyle*)next;
    
Undocumented.

TTSolidFillStyle {#TTSolidFillStyle}
================

."brush: obj-c"
    [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:nil]

<div class="image darker" markdown=1>![TTSolidFillStyle](/gfx/api/style/TTSolidFillStyle.png 144x48)</div>

### color {#color}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* color;
    
Undocumented.

### styleWithColor:next: {#styleWithColor:next:}

."brush: obj-c"
    + (TTSolidFillStyle*)styleWithColor:(UIColor*)color next:(TTStyle*)next;
    
Undocumented.

TTLinearGradientFillStyle {#TTLinearGradientFillStyle}
=========================

."brush: obj-c"
    UIColor* blue = RGBCOLOR(191, 197, 208);
    UIColor* darkBlue = RGBCOLOR(109, 132, 162);
    [TTLinearGradientFillStyle styleWithColor1:blue color2:darkBlue next:nil]

<div class="image darker" markdown=1>![TTLinearGradientFillStyle](/gfx/api/style/TTLinearGradientFillStyle.png 144x48)</div>

### color1 {#color1}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* color1;
    
Undocumented.

### color2 {#color2}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* color2;
    
Undocumented.

### styleWithColor1:color2:next: {#styleWithColor1:color2:next:}

."brush: obj-c"
    + (TTLinearGradientFillStyle*)styleWithColor1:(UIColor*)color1 color2:(UIColor*)color2
                                  next:(TTStyle*)next;
    
Undocumented.

TTReflectiveFillStyle {#TTReflectiveFillStyle}
=====================

."brush: obj-c"
    UIColor* darkBlue = RGBCOLOR(109, 132, 162);
    [TTReflectiveFillStyle styleWithColor:darkBlue next:nil]

<div class="image darker" markdown=1>![TTReflectiveFillStyle](/gfx/api/style/TTReflectiveFillStyle.png 144x48)</div>

### color {#color}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* color;
    
Undocumented.

### withBottomHighlight {#withBottomHighlight}

."brush: obj-c"
    @property (nonatomic, assign) BOOL     withBottomHighlight;
    
Undocumented.

### styleWithColor:next: {#styleWithColor:next:}

."brush: obj-c"
    + (TTReflectiveFillStyle*)styleWithColor:(UIColor*)color next:(TTStyle*)next;
    
Undocumented.

### styleWithColor:withBottomHighlight:next: {#styleWithColor:withBottomHighlight:next:}

."brush: obj-c"
    + (TTReflectiveFillStyle*)styleWithColor:(UIColor*)color
                              withBottomHighlight:(BOOL)withBottomHighlight next:(TTStyle*)next;
    
Undocumented.

TTShadowStyle {#TTShadowStyle}
=============

."brush: obj-c"
    [TTShapeStyle styleWithShape:[TTRectangleShape shape] next:
    [TTShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.5) blur:5 offset:CGSizeMake(2, 2) next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(0.25, 0.25, 0.25, 0.25) next:
    [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:nil]]]]

<div class="image darker" markdown=1>![TTShadowStyle](/gfx/api/style/TTShadowStyle.png 144x48)</div>

### color {#color}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* color;
    
Undocumented.

### blur {#blur}

."brush: obj-c"
    @property (nonatomic) CGFloat blur;
    
Undocumented.

### offset {#offset}

."brush: obj-c"
    @property (nonatomic) CGSize offset;
    
Undocumented.

### styleWithColor:blur:offset:next: {#styleWithColor:blur:offset:next:}

."brush: obj-c"
    + (TTShadowStyle*)styleWithColor:(UIColor*)color blur:(CGFloat)blur offset:(CGSize)offset
                      next:(TTStyle*)next;
    
Undocumented.

TTInnerShadowStyle {#TTInnerShadowStyle}
==================

."brush: obj-c"
    UIColor* black = RGBCOLOR(158, 163, 172);
    [TTShapeStyle styleWithShape:[TTRectangleShape shape] next:
    [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:
    [TTInnerShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.5) blur:6 offset:CGSizeMake(1, 1) next:nil]]]

<div class="image darker" markdown=1>![TTInnerShadowStyle](/gfx/api/style/TTInnerShadowStyle.png 144x48)</div>

TTSolidBorderStyle {#TTSolidBorderStyle}
==================

."brush: obj-c"
    UIColor* black = RGBCOLOR(158, 163, 172);
    [TTSolidBorderStyle styleWithColor:black width:1 next:nil]

<div class="image darker" markdown=1>![TTSolidBorderStyle](/gfx/api/style/TTSolidBorderStyle.png 144x48)</div>

### color {#color}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* color;
    
Undocumented.

### width {#width}

."brush: obj-c"
    @property (nonatomic) CGFloat width;
    
Undocumented.

### styleWithColor:width:next: {#styleWithColor:width:next:}

."brush: obj-c"
    + (TTSolidBorderStyle*)styleWithColor:(UIColor*)color width:(CGFloat)width next:(TTStyle*)next;
    
Undocumented.

TTHighlightBorderStyle {#TTHighlightBorderStyle}
======================

."brush: obj-c"
    UIColor* black = RGBCOLOR(158, 163, 172);
    [TTHighlightBorderStyle styleWithColor:black highlightColor:[UIColor whiteColor] width:1 next:nil]

<div class="image darker" markdown=1>![TTHighlightBorderStyle](/gfx/api/style/TTHighlightBorderStyle.png 144x48)</div>

### color {#color}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* color;
    
Undocumented.

### highlightColor {#highlightColor}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* highlightColor;
    
Undocumented.

### width {#width}

."brush: obj-c"
    @property (nonatomic) CGFloat width;
    
Undocumented.

### styleWithColor:highlightColor:width:next: {#styleWithColor:highlightColor:width:next:}

."brush: obj-c"
    + (TTHighlightBorderStyle*)styleWithColor:(UIColor*)color highlightColor:(UIColor*)highlightColor
                               width:(CGFloat)width next:(TTStyle*)next;
    
Undocumented.

TTFourBorderStyle {#TTFourBorderStyle}
=================

."brush: obj-c"
    UIColor* black = RGBCOLOR(158, 163, 172);
    UIColor* blue = RGBCOLOR(191, 197, 208);
    [TTFourBorderStyle styleWithTop:black right:blue bottom:black left:blue width:1 next:nil]

<div class="image darker" markdown=1>![TTFourBorderStyle](/gfx/api/style/TTFourBorderStyle.png 144x48)</div>

### top {#top}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* top;
    
Undocumented.

### right {#right}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* right;
    
Undocumented.

### bottom {#bottom}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* bottom;
    
Undocumented.

### left {#left}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* left;
    
Undocumented.

### width {#width}

."brush: obj-c"
    @property (nonatomic) CGFloat width;
    
Undocumented.

### styleWithTop:right:bottom:left:width:next: {#styleWithTop:right:bottom:left:width:next:}

."brush: obj-c"
    + (TTFourBorderStyle*)styleWithTop:(UIColor*)top right:(UIColor*)right bottom:(UIColor*)bottom
                          left:(UIColor*)left width:(CGFloat)width next:(TTStyle*)next;
    
Undocumented.

### styleWithTop:width:next: {#styleWithTop:width:next:}

."brush: obj-c"
    + (TTFourBorderStyle*)styleWithTop:(UIColor*)top width:(CGFloat)width next:(TTStyle*)next;
    
Undocumented.

### styleWithRight:width:next: {#styleWithRight:width:next:}

."brush: obj-c"
    + (TTFourBorderStyle*)styleWithRight:(UIColor*)right width:(CGFloat)width next:(TTStyle*)next;
    
Undocumented.

### styleWithBottom:width:next: {#styleWithBottom:width:next:}

."brush: obj-c"
    + (TTFourBorderStyle*)styleWithBottom:(UIColor*)bottom width:(CGFloat)width next:(TTStyle*)next;
    
Undocumented.

### styleWithLeft:width:next: {#styleWithLeft:width:next:}

."brush: obj-c"
    + (TTFourBorderStyle*)styleWithLeft:(UIColor*)left width:(CGFloat)width next:(TTStyle*)next;
    
Undocumented.

TTBevelBorderStyle {#TTBevelBorderStyle}
==================

."brush: obj-c"
    UIColor* black = RGBCOLOR(158, 163, 172);
    [TTBevelBorderStyle styleWithHighlight:[UIColor whiteColor] shadow:black width:1 lightSource:270 next:nil]

<div class="image darker" markdown=1>![TTBevelBorderStyle](/gfx/api/style/TTBevelBorderStyle.png 144x48)</div>

### highlight {#highlight}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* highlight;
    
Undocumented.

### shadow {#shadow}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* shadow;
    
Undocumented.

### width {#width}

."brush: obj-c"
    @property (nonatomic) CGFloat width;
    
Undocumented.

### lightSource {#lightSource}

."brush: obj-c"
    @property (nonatomic) NSInteger lightSource;
    
Undocumented.

### styleWithColor:width:next: {#styleWithColor:width:next:}

."brush: obj-c"
    + (TTBevelBorderStyle*)styleWithColor:(UIColor*)color width:(CGFloat)width next:(TTStyle*)next;
    
Undocumented.

### styleWithHighlight:shadow:width:lightSource:next: {#styleWithHighlight:shadow:width:lightSource:next:}

."brush: obj-c"
    + (TTBevelBorderStyle*)styleWithHighlight:(UIColor*)highlight shadow:(UIColor*)shadow
                           width:(CGFloat)width lightSource:(NSInteger)lightSource next:(TTStyle*)next;
    
Undocumented.

TTLinearGradientBorderStyle {#TTLinearGradientBorderStyle}
===========================

."brush: obj-c"
    UIColor* black = RGBCOLOR(158, 163, 172);
    UIColor* blue = RGBCOLOR(191, 197, 208);
    [TTLinearGradientBorderStyle styleWithColor1:black location1:0 color2:blue location2:1 width:1 next:nil]

<div class="image darker" markdown=1>![TTLinearGradientBorderStyle](/gfx/api/style/TTLinearGradientBorderStyle.png 144x48)</div>

### color1 {#color1}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* color1;
    
Undocumented.

### color2 {#color2}

."brush: obj-c"
    @property (nonatomic, retain) UIColor* color2;
    
Undocumented.

### location1 {#location1}

."brush: obj-c"
    @property (nonatomic) CGFloat location1;
    
Undocumented.

### location2 {#location2}

."brush: obj-c"
    @property (nonatomic) CGFloat location2;
    
Undocumented.

### width {#width}

."brush: obj-c"
    @property (nonatomic) CGFloat width;
    
Undocumented.

### styleWithColor1:color2:width:next: {#styleWithColor1:color2:width:next:}

."brush: obj-c"
    + (TTLinearGradientBorderStyle*)styleWithColor1:(UIColor*)color1 color2:(UIColor*)color2
                                    width:(CGFloat)width next:(TTStyle*)next;
    
Undocumented.

### styleWithColor1:location1:color2:location2:width:next: {#styleWithColor1:location1:color2:location2:width:next:}

."brush: obj-c"
    + (TTLinearGradientBorderStyle*)styleWithColor1:(UIColor*)color1 location1:(CGFloat)location1
                                    color2:(UIColor*)color2 location2:(CGFloat)location2
                                    width:(CGFloat)width next:(TTStyle*)next;
    
Undocumented.

TTStyleDelegate {#TTStyleDelegate}
===============

### textForLayerWithStyle: {#textForLayerWithStyle:}

."brush: obj-c"
    - (NSString*)textForLayerWithStyle:(TTStyle*)style;
    
Undocumented.

### imageForLayerWithStyle: {#imageForLayerWithStyle:}

."brush: obj-c"
    - (UIImage*)imageForLayerWithStyle:(TTStyle*)style;
    
Undocumented.

### drawLayer:withStyle: {#drawLayer:withStyle:}

."brush: obj-c"
    - (void)drawLayer:(TTStyleContext*)context withStyle:(TTStyle*)style;
    
Undocumented.

