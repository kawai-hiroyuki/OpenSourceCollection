//
//  KHFEmbedTextViewController.h
//  SettingViewController
//
//  Created by obumin on 2014/08/20.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHFEmbedTextViewController : UIViewController

@property (strong, nonatomic) NSString *textfile;
@property (strong, nonatomic) UITextView *textView;

// インスタンスを取得する
+ (KHFEmbedTextViewController*)getInstance;

@end
