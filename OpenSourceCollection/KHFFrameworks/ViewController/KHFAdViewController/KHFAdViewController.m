//
//  HKiAdViewController.m
//  AdCollection
//
//  Created by obumin on 2014/09/27.
//  Modified by obumin on 2014/12/23
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFAdViewController.h"

@interface KHFAdViewController () <ADBannerViewDelegate, GADBannerViewDelegate>
// Statusbarに透過があるかどうか
@property (nonatomic) float translucentGap;

@property (weak) id statusBarWillChange;
@property (weak) id statusBarDidChange;

@property (retain, nonatomic) ADBannerView *iadView;
@property (retain, nonatomic) GADBannerView *admobView;

@end

@implementation KHFAdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UINavigationBar appearance] isTranslucent]){
        // 透明でない場合はGapをつける必要がある
        // statusbarとnavigationbarのサイズを引く
        self.translucentGap = [UIApplication sharedApplication].statusBarFrame.size.height
        + self.navigationController.navigationBar.frame.size.height;
    } else {
        self.translucentGap = 0;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear
{
    // Viewが消えたときにNSNotificationCenterを削除する
    [[NSNotificationCenter defaultCenter] removeObserver:self.statusBarWillChange];
    [[NSNotificationCenter defaultCenter] removeObserver:self.statusBarDidChange];
}

// Adの設定をする
- (void)loadAd
{
    switch (self.adType) {
        case KHFAdTypeIAd:
            [self loadIAd];
            break;
        case KHFAdTypeAdmob:
            [self loadAdmob];
            break;
        default:
            // adTypeを指定しないときはiAdにする
            [self loadIAd];
            break;
    }
}

// iAdのインスタンスを作成する
- (void)loadIAd
{
    
    // iAd
//    _adView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
    _iadView = [[ADBannerView alloc] initWithFrame:CGRectMake(0,
                                                             self.view.frame.size.height,
                                                             0,
                                                             0)];
    _iadView.delegate = self;
    // adViewのフレーム矩形が変更された時にサブビューのサイズを自動的に変更
    _iadView.autoresizesSubviews = YES;
    // 非表示にしておく
    _iadView.alpha = 0.0f;
    
    [self.view addSubview:_iadView];
    self.adView = _iadView;
    
    [self configureStatusbar];

}

- (void)loadAdmob
{
    // 画面サイズによって自動的にバナーサイズを変更する
    // スマート バナー - Google Mobile Ads SDK — Google Developers
    // https://developers.google.com/mobile-ads-sdk/docs/admob/smart-banners?hl=ja
    _admobView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];

    // 広告ユニット ID を指定する
//    _admobView.adUnitID = @"ca-app-pub-9519424358678937/5999393004";
    _admobView.adUnitID = self.adUnitID;
    
    // ユーザーに広告を表示した場所に後で復元する UIViewController をランタイムに知らせて
    // ビュー階層に追加する
    _admobView.rootViewController = self;
    // 一般的なリクエストを行って広告を読み込む
    GADRequest *req = [GADRequest request];
    req.testDevices = self.testDevices;
    [_admobView loadRequest:req];
    
    [self.view addSubview:_admobView];
    _adView = _admobView;
    
    [self configureStatusbar];
}

- (void)configureStatusbar
{
    // StatusBarのサイズが変更したときの処理
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    self.statusBarWillChange = [center
                                addObserverForName:UIApplicationWillChangeStatusBarFrameNotification
                                object:nil
                                queue:[NSOperationQueue mainQueue]
                                usingBlock:^(NSNotification *note) {
                                    NSLog(@"UIApplicationWillChangeStatusBarFrameNotification !!!");
                                    [self statusBarWillChange:note];
                                }
                                ];
    self.statusBarDidChange = [center
                               addObserverForName:UIApplicationDidChangeStatusBarFrameNotification
                               object:nil
                               queue:[NSOperationQueue mainQueue]
                               usingBlock:^(NSNotification *note) {
                                   NSLog(@"UIApplicationDidChangeStatusBarFrameNotification !!!");
                                   [self statusBarDidChange:note];
                               }
                               ];
}

// トップにiAdを設置する（StatusBarとかぶる）
- (void)addAdViewAtTop
{
    [self loadAd];
    
    // 横向き、縦向きに回転した際に、自動的に広告の横幅を調整し、画面上に固定
    // ※画面下に表示する場合は、コメントアウト。
    _adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
}

// 下にiAdを設置する（Toolbarとかぶる）
- (void)addAdViewAtBottom
{
    [self loadAd];
    
    // 画面(ビュー)の下に表示する場合
    _adView.frame = CGRectMake(0, self.view.frame.size.height - _adView.frame.size.height, _adView.frame.size.width, _adView.frame.size.height);
    // 横向き、縦向きに回転した際に、自動的に広告の横幅を調整し、画面下に固定
    // ※画面上に表示する場合は、コメントアウト。
    _adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
}

// Statusbarの下にiAdを設置する
- (void)addAdViewUnderStatusbar
{
    [self loadAd];
    
    // 画面(ビュー)の下に表示する場合
    // http://dendrocopos.jp/wp/archives/298
    CGFloat y = [UIApplication sharedApplication].statusBarFrame.size.height;
    _adView.frame = CGRectMake(0, y, _adView.frame.size.width, _adView.frame.size.height);
    
    // 横向き、縦向きに回転した際に、自動的に広告の横幅を調整し、画面上に固定
    // ※画面下に表示する場合は、コメントアウト。
    _adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
}

// ツールバーの上に広告を表示する
- (void)addAdViewAboveToolbar
{
    [self loadAd];
    
    CGFloat toolbarHeight = 0;
    if (!self.navigationController.isToolbarHidden) {
        // Toolbarがある場合はツールバーのサイズを取得する
        toolbarHeight = self.navigationController.toolbar.frame.size.height;
    }
    
    // 画面(ビュー)の下に表示する場合
    CGFloat y = self.view.frame.size.height // 全体の高さ
//    + [UIApplication sharedApplication].statusBarFrame.size.height  // Statusbarのサイズを足す
    - toolbarHeight                         // ツールバーの高さを引く
    - _adView.frame.size.height;            // AdViewの高さを引く
    
    
    _adView.frame = CGRectMake(0, y, _adView.frame.size.width, _adView.frame.size.height);
    
    // 横向き、縦向きに回転した際に、自動的に広告の横幅を調整し、画面下に固定
    // ※画面上に表示する場合は、コメントアウト。
    _adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
}

// ナビゲーションバーの下に広告を表示する
- (void)addAdViewUnderNavigationBar
{
    [self loadAd];
    
    // 画面(ビュー)の下に表示する場合
    CGFloat y = [UIApplication sharedApplication].statusBarFrame.size.height
    + self.navigationController.navigationBar.frame.size.height; // ツールの高さを引く
    
    _adView.frame = CGRectMake(0, y, _adView.frame.size.width, _adView.frame.size.height);
    
    // 横向き、縦向きに回転した際に、自動的に広告の横幅を調整し、画面上に固定
    // ※画面下に表示する場合は、コメントアウト。
    _adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
}

#pragma mark Delegate Method
// 広告バナーが読み込まれたときの処理
- (void)adBannerViewDidLoad:(UIView *)banner
{
    [UIView animateWithDuration:1.0
                     animations:^{
                         _adView.alpha = 1.0;
                     }];
    
    self.adView.hidden = NO;
}

// 広告バナーの読み込みに失敗したときの処理
- (void)adBannerView:(UIView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    _adView.frame = CGRectMake(0,
                               self.view.frame.size.height,
                               0,
                               0);
    _adView.alpha = 0.0;
    _adView.hidden = YES;
}

#pragma mark ADBannerViewDelegate
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"visible ad");
    [self adBannerViewDidLoad:banner];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"Not have visible iAd");
    [self adBannerView:banner didFailToReceiveAdWithError:error];
}

#pragma mark GADBannerViewDelegate
- (void)adViewDidReceiveAd:(GADBannerView *)view
{
    NSLog(@"visible admob");
    [self adBannerViewDidLoad:view];
}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error
{
    NSLog(@"Not have visible admob");
    [self adBannerView:view didFailToReceiveAdWithError:error];
}

#pragma mark UI
- (void)application:(UIApplication *)application didChangeStatusBarFrame:(CGRect)oldStatusBarFrame{
      NSLog(@"appHeightDidChange=%f",[UIApplication sharedApplication].statusBarFrame.size.height);
}

- (void)application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame{
      NSLog(@"appHeightWillChange=%f",[UIApplication sharedApplication].statusBarFrame.size.height);
}

- (IBAction)statusBarWillChange:(id)sender
{
    NSLog(@"statusBarWillChange");
}

- (IBAction)statusBarDidChange:(id)sender
{
    NSLog(@"statusBarDidChange");
}
@end
