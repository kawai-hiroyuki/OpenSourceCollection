//
//  UIResponder+Color.m
//  OSCDesign
//
//  Created by obumin on 2014/12/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "UIResponder+Color.h"
#import "UIColor+Extends.h"

@implementation UIResponder (Color)

// アプリの色を設定する
// NavigationBarは透過する
- (void)initAppWithTintColor:(UIColor *)tintColor
              titleTintColor:(UIColor *)titleTintColor
      navigationBarTintColor:(UIColor *)navigationBarTintColor
{
    [self initAppWithTintColor:tintColor
                titleTintColor:titleTintColor
        navigationBarTintColor:navigationBarTintColor
                   translucent:YES];
}

// アプリの色を設定する
// NavigationBarの透過設定を変更できる
- (void)initAppWithTintColor:(UIColor *)tintColor
              titleTintColor:(UIColor *)titleTintColor
      navigationBarTintColor:(UIColor *)navigationBarTintColor
                 translucent:(BOOL)translucent
{
    // 全体のtintColor
    if (tintColor) {
        //        self.window.tintColor = tintColor;
        [[UIView appearance] setTintColor:tintColor];
    }
    
    if (titleTintColor) {
        // タイトルの文字色を変更する
        [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName:titleTintColor};
    }
    
    if (navigationBarTintColor) {
        // NavigationBarを透過しないようにする
        // この処理を行わないと色が濁る (ios7 and later)
        // http://hachinobu.hateblo.jp/entry/20131010/1381399530
        //        [UINavigationBar appearance].translucent = NO;
        if (!translucent) {
            [[UINavigationBar appearance] setTranslucent:NO];
        }
//        NSLog(@"isTranslucent:%d", [[UINavigationBar appearance] isTranslucent]);
        
        // NavigationBarの色を変更する
        [UINavigationBar appearance].barTintColor = navigationBarTintColor;
//        [UINavigationBar appearance].barTintColor = [UIColor translucentNavigationColor:navigationBarTintColor];
        // ステータスバーの色を淡色(白)に変更
        // ただしinfo.plistで”View controller-based status bar”をNOにしておく必要がある。
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        // Toolbarの色を変更する
        [UIToolbar appearance].barTintColor = navigationBarTintColor;
    }
}

@end
