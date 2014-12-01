//
//  ViewController.m
//  JAColorPicker
//
//  Created by Justin Brower on 11/30/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

#import "ViewController.h"
#import "JAColorPicker.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    //add a color picker
    colorPicker = [[JAColorPicker alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    
    //use a sample picker...
    UIImage *pickerImage = [UIImage imageNamed:@"multiplechoices.jpg"];
    if (pickerImage == nil){
        NSLog(@"Couldn't load picker image.");
        return;
    }
    [colorPicker setPickerImage:pickerImage];
    [colorPicker setDelegate:self];
    [colorPicker setPreviewEnabled:YES];
    [colorPicker setPreviewThickness:4];
    
    colorPickerTwo = [[JAColorPicker alloc] initWithFrame:CGRectMake(100, 500, 200, 200)];
    [colorPickerTwo setPickerImage:[UIImage imageNamed:@"map-saturation.png"]];
    [colorPickerTwo setDelegate:self];
    [colorPickerTwo setPreviewEnabled:YES];
    [colorPickerTwo setPreviewThickness:4];
    

    [self.view addSubview:colorPickerTwo];
    
    previewView = [[UIView alloc] initWithFrame:CGRectMake(0,0,70,70)];
    [previewView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:previewView];
    
    NSLog(@"Adding color picker...");
    [self.view addSubview:colorPicker];
    
    // Do any additional setup after loading the view, typically from a nib.
}

//This method is called when after the color picker selects a color
- (void)colorPicker:(JAColorPicker *)colorPicker didSelectColor:(UIColor *)selection {
    
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha =0.0;
    [selection getRed:&red green:&green blue:&blue alpha:&alpha];
    
    NSLog(@"Got color with rgba = (%f,%f,%f,%f)", red, green, blue, alpha);
    
    [previewView setBackgroundColor:selection];
}

//This method is called when the color picker is disabled through double-touch. (cancelled).
- (void)colorPickerSelectionWasCancelled:(JAColorPicker *)colorPicker {
    
    NSLog(@"Cancelled.");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
