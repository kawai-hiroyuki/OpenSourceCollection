//
//  UIColor+Extends.m
//  OSCDesign
//
//  Created by obumin on 2014/12/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "UIColor+Extends.h"

@implementation UIColor (Extends)

// Thanks to http://stackoverflow.com/questions/3805177/how-to-convert-hex-rgb-color-codes-to-uicolor
+ (UIColor *) colorFromHexCode:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if ([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *) rgbColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.0f
                           green:green / 255.0f
                            blue:blue / 255.0f alpha:alpha];
}


+ (UIColor *) blendedColorWithForegroundColor:(UIColor *)foregroundColor
                              backgroundColor:(UIColor *)backgroundColor
                                 percentBlend:(CGFloat) percentBlend {
    CGFloat onRed, offRed, newRed, onGreen, offGreen, newGreen, onBlue, offBlue, newBlue, onWhite, offWhite;
    if (![foregroundColor getRed:&onRed green:&onGreen blue:&onBlue alpha:nil]) {
        [foregroundColor getWhite:&onWhite alpha:nil];
        onRed = onWhite;
        onBlue = onWhite;
        onGreen = onWhite;
    }
    if (![backgroundColor getRed:&offRed green:&offGreen blue:&offBlue alpha:nil]) {
        [backgroundColor getWhite:&offWhite alpha:nil];
        offRed = offWhite;
        offBlue = offWhite;
        offGreen = offWhite;
    }
    newRed = onRed * percentBlend + offRed * (1-percentBlend);
    newGreen = onGreen * percentBlend + offGreen * (1-percentBlend);
    newBlue = onBlue * percentBlend + offBlue * (1-percentBlend);
    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1.0];
}

//
//
// translucent = YES(default) 透明でも元の色を維持させる
// translucent = NO
//
// http://program.station.ez-net.jp/special/handbook/objective-c/uicolor/rgba-get.asp
+ (UIColor *)translucentNavigationColor:(UIColor *)color
{
    CGFloat GAP = 32;
    CGFloat red, green, blue, alpha;
    // 透明だった場合は色を変化させる
    if ([[UINavigationBar appearance] isTranslucent]) {
        
        if([color getRed:&red green:&green blue:&blue alpha:&alpha]) {
            red += GAP;
            green += GAP;
            blue += GAP;
            return [UIColor rgbColorWithRed:red green:green blue:blue alpha:alpha];
        }
    }
    return color;
}
@end
