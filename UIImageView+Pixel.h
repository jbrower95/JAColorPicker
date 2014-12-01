//
//  UIImageView+Pixel.h
//  JAColorPicker
//
//  Created by Justin Brower on 11/30/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

//  A category on UIView that allows you to get the pixel at any point. Uses 

#import <UIKit/UIKit.h>

//represents a pixel
typedef struct _pixel_t {
    
    //alpha: [0, 1]
    float a;
    
    //red:   [0, 1]
    float r;
    
    //green: [0, 1];
    float g;
    
    //blue:  [0, 1];
    float b;
    
} pixel_t;



@interface UIImageView (Pixel)

//Returns a pixel_t struct containing data about the pixel at the given point.
- (UIColor *)getPixelAtPoint:(CGPoint)point;

@end
