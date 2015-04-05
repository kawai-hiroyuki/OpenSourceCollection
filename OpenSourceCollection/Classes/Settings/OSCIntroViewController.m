//
//  OSCIntroViewController.m
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/05.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "OSCIntroViewController.h"

@interface OSCIntroViewController ()

@end

@implementation OSCIntroViewController

/*
 * シングルトン処理
 * http://programming-ios.com/objective-c-singleton/
 */
+ (OSCIntroViewController*)sharedInstance {
    static OSCIntroViewController* sharedSingleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton = [[self alloc] initSharedInstance];
    });
    return sharedSingleton;
}

- (id)initSharedInstance {
    self = [super init];
    if (self) {
        // 初期化処理
    }
    return self;
}

- (id)init {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

#pragma mark - EAIntroPage
- (void)showIntroPage:(UIView*)view
{
    [self showIntroPage:view animateDuration:0.0];
}

- (void)showIntroPage:(UIView*)view animateDuration:(CGFloat)duration
{
    EAIntroPage *page1 = [EAIntroPage page];
    //    page1.title = NSLocalizedString(@"このアプリは愛知県の知多半島にある88ヶ所の弘法大師（空海）ゆかりの霊場を巡礼するための旅行ガイドです", @"Intro page 1");
    // 知多四国八十八ヶ所巡礼ガイド
    page1.title = NSLocalizedString(@"Intro_Page1_Title", @"Intro page1 title");
    page1.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    // このアプリは愛知県の知多半島にある\n88ヶ所の弘法大師（空海）ゆかりの霊場を\n巡礼するための旅行ガイドです
    page1.desc = NSLocalizedString(@"Intro_Page1_Desc", @"Intro page1 desc");
    page1.descFont = [UIFont fontWithName:@"Georgia-Italic" size:16];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"intro1.OSCg"]];
    page1.titleIconPositionY = 100;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    //霊場に関する情報や地図を\n見ることができます
    page2.title = NSLocalizedString(@"Intro_Page2_Title", @"Intro page2 title");
    page2.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page2.descFont = [UIFont fontWithName:@"Georgia-Italic" size:18];
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"intro2"]];
    page2.titleIconPositionY = 90;
    
    EAIntroPage *page3 = [EAIntroPage page];
    // 霊場への道順を\n調べることができます
    page3.title = NSLocalizedString(@"Intro_Page3_Title", @"Intro page3 title");
    page3.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page3.descFont = [UIFont fontWithName:@"Georgia-Italic" size:18];
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"intro3"]];
    page3.titleIconPositionY = 90;
    
    EAIntroPage *page4 = [EAIntroPage page];
    
    // 巡礼での思い出を\n記録することができます
    page4.title = NSLocalizedString(@"Intro_Page4_Title", @"Intro page4 title");
    page4.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page4.descFont = [UIFont fontWithName:@"Georgia-Italic" size:18];
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"intro4"]];
    page4.titleIconPositionY = 90;
    
    EAIntroPage *page5 = [EAIntroPage page];
    // さぁ、弘法大師さまと共に出掛けましょう
    page5.title = NSLocalizedString(@"Intro_Page5_Title", @"Intro page5 title");
    page5.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page5.descFont = [UIFont fontWithName:@"Georgia-Italic" size:16];
    page5.bgImage = [UIImage imageNamed:@"bg1"];
    page5.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"intro5"]];
    page5.titleIconPositionY = 90;
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:view.bounds andPages:@[page1, page2, page3, page4, page5]];
    // スキップ
    [intro.skipButton setTitle:NSLocalizedString(@"skip", @"skip button title") forState:UIControlStateNormal];
    
    [intro setDelegate:self];
    //    [intro showInView:self.view animateDuration:0.0];
    [intro showInView:view animateDuration:duration];
}

// 終了処理
- (void)introViewDidFinish:(EAIntroView *)introView {
    // 紹介が終了したことをdelegateに通知する
    if ([self.delegate respondsToSelector:@selector(introViewDidFinish:)]) {
        [self.delegate introViewDidFinish:introView];
    }
}

@end
