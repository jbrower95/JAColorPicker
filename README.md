JAColorPicker
=============

JAColorPicker - A customizable color picker for iOS

The Idea -
  1. You probably want to design your own color picker. But you don't want to write your own color picker class / protocol
  every single time you want to implement one.
  
  2. You want some way to easily preview the color you've selected, or provide your own way to preview it that's 
  possible much more advanced.
  
If you said "yeah, I guess" to either of the above, you're a candidate for JAColorPicker.


Usage:

I. View the Demo

i. Clone the repository
    git clone https://github.com/jbrower95/JAColorPicker.git
ii. Open the Xcode Project
iii. Compile / Run. It targets 8.x and links against QuartzCore.


II. Use it in your own project
Copy the contents of the JAColorPicker group into your own project.


Sample Initialization:
    
    JAColorPicker *colorPicker = [[JAColorPicker alloc] initWithFrame:CGRectMake(0,0,100,50)];
    
    //load your own image for the actual color picker!
    [colorPicker setPickerImage:[UIImage imageNamed:@"my_picker.png"];
    
    //set the preview thickness! You might want to experiment with different values.
    [colorPicker setPreviewEnabled:YES];
    [colorPicker setPreviewThickness:4];

    //set the delegate if you want to receive any sort of information about what color the user selected.
    [colorPicker setDelegate:self];
    
If you want to receive callbacks, you must conform to the JAColorPickerDelegate Protocol. It's got one method that tells you when you've received a color.

ViewController.m
    - (void)colorPicker:(JAColorPicker *)picker didSelectColor:(UIColor *)color {
        //do something with 'color'
        NSLog(@"We received a color!");
    }
    
Included are two images. I don't own them, but you can feel free to make your own images during distribution.

License:

This project is released under the MIT license. (see below!)

The MIT License (MIT)

Copyright (c) 2014 Justin Brower

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
  
