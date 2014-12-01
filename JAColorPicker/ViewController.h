//
//  ViewController.h
//  JAColorPicker
//
//  Created by Justin Brower on 11/30/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JAColorPicker.h"
@interface ViewController : UIViewController <JAColorPickerDelegate> {
    
    JAColorPicker *colorPicker;
    JAColorPicker *colorPickerTwo;
    UIView *previewView;
    
}
@property (strong, nonatomic) JAColorPicker *colorPicker;

@end

