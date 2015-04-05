//
//  OSCIntroViewController.h
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/05.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAIntroView.h"

@protocol OSCIntroViewControllerDelegate <NSObject>
@optional
- (void)introViewDidFinish:(EAIntroView *)introView;

@end

@interface OSCIntroViewController : NSObject <EAIntroDelegate>

@property (weak, nonatomic) id<OSCIntroViewControllerDelegate> delegate;

// インスタンスの作成（シングルトン）
+ (OSCIntroViewController*)sharedInstance;

- (void)showIntroPage:(UIView*)view;
- (void)showIntroPage:(UIView*)view animateDuration:(CGFloat)duration;

@end
