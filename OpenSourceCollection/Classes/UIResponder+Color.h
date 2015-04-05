//
//  UIResponder+Color.h
//  OSCDesign
//
//  Created by obumin on 2014/12/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//
//  AppDelegate

#import <UIKit/UIKit.h>

@interface UIResponder (Color)

// アプリの色を設定する
// NavigationBarは透過する
- (void)initAppWithTintColor:(UIColor *)tintColor
              titleTintColor:(UIColor *)titleTintColor
      navigationBarTintColor:(UIColor *)navigationBarTintColor;

// アプリの色を設定する
// NavigationBarの透過設定を変更できる
- (void)initAppWithTintColor:(UIColor *)tintColor
              titleTintColor:(UIColor *)titleTintColor
      navigationBarTintColor:(UIColor *)navigationBarTintColor
                 translucent:(BOOL)translucent;
@end
