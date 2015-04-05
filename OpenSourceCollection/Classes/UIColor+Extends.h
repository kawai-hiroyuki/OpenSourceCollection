//
//  UIColor+Extends.h
//  OSCDesign
//
//  Created by obumin on 2014/12/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extends)
// #FFFFFFでUIColorを設定する
+ (UIColor *) colorFromHexCode:(NSString *)hexString;
// 0~255でUIColorを設定する
+ (UIColor *) rgbColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIColor *) blendedColorWithForegroundColor:(UIColor *)foregroundColor
                              backgroundColor:(UIColor *)backgroundColor
                                 percentBlend:(CGFloat) percentBlend;

//
// translucent = YES(default) 透明でも元の色を維持させる
// translucent = NO
//
// http://program.station.ez-net.jp/special/handbook/objective-c/uicolor/rgba-get.asp
+ (UIColor *)translucentNavigationColor:(UIColor *)color;
@end
