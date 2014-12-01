//
//  JAColorPicker.m
//  JAColorPicker
//
//  Created by Justin Brower on 11/30/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

#import "JAColorPicker.h"
#import "UIImageView+Pixel.h"



@implementation JAColorPicker
@synthesize delegate, selector;


- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    if (touchesDown){
        //draw a circle preview of the color that they selected
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGRect rect = CGRectMake(lastTouch.x, lastTouch.y, 30, 30);
        CGContextSetFillColorWithColor(context, selectedColor.CGColor);
        CGContextFillEllipseInRect(context, rect);
    }
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]){
        isPreviewEnabled = YES;
        touchesDown = NO;
        self.selector.layer.borderColor = [[UIColor blackColor] CGColor];
        self.selector.layer.borderWidth = PREVIEW_THICKNESS;
        previewThickness = PREVIEW_THICKNESS;
        self.clipsToBounds = NO;
    }
        return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] == 1){
        [self touchesMoved:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] == 1){
        UITouch *touch = [touches anyObject];
        
        CGPoint loc = [touch locationInView:self];
        if (CGRectContainsPoint(selector.frame, loc)){
            loc = [self convertPoint:loc toView:selector];
            //this is a good touch
            lastTouch = [touch locationInView:selector];
            touchesDown = YES;
            selectedColor = [selector getPixelAtPoint:lastTouch];
        }

        [self handlePreview];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] == 1){
        UIColor *pixel = [selector getPixelAtPoint:[[touches anyObject] locationInView:self]];
        
        if (delegate){
            [delegate colorPicker:self didSelectColor:pixel];
        }
        touchesDown = NO;
        [self handlePreview];
    }
}


//Sets the image to be used for the actual picker.
- (void)setPickerImage:(UIImage *)picker {
    
    self.backgroundColor = [UIColor grayColor];
    
    if (!selector){
        selector = [[UIImageView alloc] initWithImage:picker];
        selector.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
    
    [selector setImage:picker];
    
    if (!([selector superview] == self)){
        [self addSubview:selector];
    }
    
    [self handlePreview];
    
}

- (void)handlePreview {
    if (isPreviewEnabled){
        if (touchesDown){
            self.selector.layer.borderColor = [selectedColor CGColor];
            self.selector.layer.borderWidth = previewThickness;
        }
    } else {
        self.selector.layer.borderWidth = 0;
    }
}

//If this is set to true, enables the little floating preview.
- (void)setPreviewEnabled:(BOOL)isEnabled {
    isPreviewEnabled = isEnabled;
    [self handlePreview];
}
//Sets the thickness of the preview border. For smaller images, you probably want this to be smaller.
- (void)setPreviewThickness:(int)thickness {
    previewThickness = thickness;
    [self handlePreview];
}

@end
