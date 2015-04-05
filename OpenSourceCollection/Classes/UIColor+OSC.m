//
//  UIColor+WarmUpRunning.m
//  OSCDesign
//
//  Created by obumin on 2014/12/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "UIColor+OSC.h"

@implementation UIColor (OSC)

//  WarmUP Running App on App Design Served
//  http://www.appdesignserved.co/gallery/WarmUP-Running-App/15475243
+ (UIColor *) appTintColor {
    static UIColor *color = nil;
    static dispatch_once_t dispatchToken;
    
    dispatch_once(&dispatchToken, ^{
        color = [UIColor rgbColorWithRed:209.0f green:32.0f blue:26.0f alpha:1.0f];
    });
    return color;
}

+ (UIColor *) appBackgroundColor {
    static UIColor *color = nil;
    static dispatch_once_t dispatchToken;
    
    dispatch_once(&dispatchToken, ^{
        color = [UIColor rgbColorWithRed:39.0f green:39.0f blue:39.0f alpha:1.0f];
    });
    return color;
}

+ (UIColor *) tableViewBackgroundColor {
    static UIColor *color = nil;
    static dispatch_once_t dispatchToken;
    
    dispatch_once(&dispatchToken, ^{
        color = [UIColor rgbColorWithRed:250.0f green:250.0f blue:250.0f alpha:1.0f];
    });
    return color;
}

+ (UIColor *) tableViewSectionViewBackgroundColor {
    static UIColor *color = nil;
    static dispatch_once_t dispatchToken;
    
    dispatch_once(&dispatchToken, ^{
        color = [UIColor rgbColorWithRed:200.0f green:200.0f blue:200.0f alpha:1.0f];
    });
    
    return color;
}

+ (UIColor *) navigationBarBackgroundColor {
    static UIColor *color = nil;
    static dispatch_once_t dispatchToken;
    
    dispatch_once(&dispatchToken, ^{
        color = [UIColor rgbColorWithRed:71.0f green:71.0f blue:71.0f alpha:1.0f];
    });
    
    return color;
}

+ (UIColor *) exampleCellBackgroundColor {
    static UIColor *color = nil;
    static dispatch_once_t dispatchToken;
    
    dispatch_once(&dispatchToken, ^{
        color = [UIColor rgbColorWithRed:255.0f green:248.0f blue:255.0f alpha:1.0f];
    });
    
    return color;
}
@end
