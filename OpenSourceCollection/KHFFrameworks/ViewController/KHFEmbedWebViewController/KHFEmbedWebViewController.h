//
//  KHFEmbedWebViewController.h
//  SettingViewController
//
//  Created by obumin on 2014/08/20.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHFEmbedWebViewController : UIViewController

@property (strong, nonatomic) NSString *startUrl;
@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) UIBarButtonItem *goBackButton;
@property (strong, nonatomic) UIBarButtonItem *reloadButton;
@property (strong, nonatomic) UIBarButtonItem *goHomeButton;
@property (strong, nonatomic) UIBarButtonItem *goForwardButton;

+ (KHFEmbedWebViewController*)getInstance;
- (void)setUrl:(NSString *)url;
- (void)goBackButtonClicked:(UIBarButtonItem *)sender;
- (void)goHomeButtonClicked:(UIBarButtonItem *)sender;
- (void)goForwardButtonClicked:(UIBarButtonItem *)sender;
- (void)reloadButtonClicked:(UIBarButtonItem *)sender;

@end
