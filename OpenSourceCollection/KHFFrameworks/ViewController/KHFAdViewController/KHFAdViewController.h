//
//  KHFAdViewController.h
//  KHFFramework
//
//  Created by obumin on 2014/09/27.
//  Modified by obumin on 2014/12/23
//  Modified by obumin on 2015/01/11 Admob対応
//   Admob SDK が必要
//   pod 'Google-Mobile-Ads-SDK', '~> 6.10'
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//  Modified by obumin on 2015/01/16
//   バナーサイズを画面サイズによって自動的に変更するように変更


#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <GADBannerView.h>

typedef NS_ENUM(NSInteger, KHFAdType) {
    KHFAdTypeIAd,
    KHFAdTypeAdmob
};

@interface KHFAdViewController : UIViewController

@property (retain, nonatomic) UIView *adView;

@property (nonatomic) KHFAdType adType;
// 広告ユニット ID を指定する
@property (strong, nonatomic) NSString *adUnitID;
@property (strong, nonatomic) NSArray *testDevices;


// トップにiAdを設置する（StatusBarとかぶる）
//- (void)addAdViewAtTop;
// 下にiAdを設置する（Toolbarとかぶる）
//- (void)addAdViewAtBottom;
// Statusbarの下にiAdを設置する
- (void)addAdViewUnderStatusbar;
// ツールバーの上に広告を表示する
- (void)addAdViewAboveToolbar;
// ナビゲーションバーの下に広告を表示する
- (void)addAdViewUnderNavigationBar;

//- (void)statusBarWillChange:(id)sender;
//- (void)statusBarDidChange:(id)sender;

@end
