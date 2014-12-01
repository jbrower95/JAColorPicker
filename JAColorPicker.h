//
//  JAColorPicker.h
//  JAColorPicker
//
//  Created by Justin Brower on 11/30/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+Pixel.h"

#define DEFAULT_PICKER_WIDTH 100
#define DEFAULT_PICKER_HEIGHT 100
#define PREVIEW_THICKNESS 5

@protocol JAColorPickerDelegate;

@interface JAColorPicker : UIView {
    
    //the delegate
    id<JAColorPickerDelegate> delegate;

    //true if there is a touch currently placed down
    BOOL touchesDown;
    
    //the point representing the location of the last touch
    CGPoint lastTouch;
    
    //this imageview contains the image palette
    UIImageView *selector;
    
    //the currently selected color;
    UIColor *selectedColor;
    
    //the preview popup.
    UIView *previewPopup;
    
    //whether or not the preview is enabled
    BOOL isPreviewEnabled;
    
    //the thickness of the preview
    int previewThickness;
}

//Sets the image to be used for the actual picker.
- (void)setPickerImage:(UIImage *)picker;

//If this is set to true, enables the little floating preview.
- (void)setPreviewEnabled:(BOOL)isEnabled;

//Sets the thickness of the preview border. For smaller images, you probably want this to be smaller.
- (void)setPreviewThickness:(int)thickness;

@property (nonatomic) UIImageView *selector;
@property (nonatomic) id<JAColorPickerDelegate> delegate;

@end



@protocol JAColorPickerDelegate

//This method is called when after the color picker selects a color
- (void)colorPicker:(JAColorPicker *)colorPicker didSelectColor:(UIColor *)selection;

@end