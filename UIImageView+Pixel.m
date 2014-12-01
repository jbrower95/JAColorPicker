//
//  UIView+Pixel.m
//  JAColorPicker
//
//  Created by Justin Brower on 11/30/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

#import "UIImageView+Pixel.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImageView (Pixel)

//Method borrowed/refined from ivanzoid/ikit/UIView+ColorOfPoint
- (UIColor *)getPixelAtPoint:(CGPoint)point {
    
    NSLog(@"Getting pixel at point (%f, %f)", point.x, point.y);
    
    unsigned char pixel[4] = {0};
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    //Create a bitmap context to render our view in
    CGContextRef context = CGBitmapContextCreate(pixel, 1, 1, 8, 4, colorSpace, kCGBitmapAlphaInfoMask & kCGImageAlphaPremultipliedLast);
    CGContextTranslateCTM(context, -point.x, -point.y);
    
    [self.layer renderInContext:context];
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    return [UIColor colorWithRed:pixel[0]/255.0 green:pixel[1]/255.0 blue:pixel[2]/255.0 alpha:pixel[3]/255.0];
}


@end
