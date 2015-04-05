//
//  KHFEmbedWebViewController.m
//  SettingViewController
//
//  Created by obumin on 2014/08/20.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFEmbedWebViewController.h"

@interface KHFEmbedWebViewController () <UIWebViewDelegate>

@end

@implementation KHFEmbedWebViewController

// インスタンス
+ (KHFEmbedWebViewController*)getInstance
{
    KHFEmbedWebViewController *vc = [[KHFEmbedWebViewController alloc] init];
    return vc;
}


- (void)setUrl:(NSString *)url
{
    if (self.startUrl != url) {
        self.startUrl = url;
    }
    
}

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
    // Do any additional setup after loading the view.
    self.webView = [[UIWebView alloc] init];
    self.webView.frame = self.view.frame;
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
//    NSURL *url = [NSURL URLWithString:@"http://www.yahoo.co.jp"];
    NSURL *url = [NSURL URLWithString:self.startUrl];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    self.goBackButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_button"]
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(goBackButtonClicked:)];
    UIBarButtonItem *flexibleSpace1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.reloadButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reload_button"]
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(reloadButtonClicked:)];
    UIBarButtonItem *flexibleSpace2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.goHomeButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home_button"]
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(goHomeButtonClicked:)];
    UIBarButtonItem *flexibleSpace3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.goForwardButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"forward_button"]
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(goForwardButtonClicked:)];

    NSArray *toolbarItems = @[self.goBackButton, flexibleSpace1,
                              self.reloadButton, flexibleSpace2,
                              self.goHomeButton, flexibleSpace3,
                              self.goForwardButton];
    [self setToolbarItems:toolbarItems animated:YES];
    
    self.goBackButton.enabled = NO;
    self.goForwardButton.enabled = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // Toolbarを設定する
    self.navigationController.toolbarHidden = NO;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    // Toolbarを設定する
    self.navigationController.toolbarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goBackButtonClicked:(UIBarButtonItem *)sender {
    NSLog(@"backButtonClicked");
    [self.webView goBack];
}

- (void)goHomeButtonClicked:(UIBarButtonItem *)sender {
    NSLog(@"homeButtonClicked");
    NSURL *url = [NSURL URLWithString:self.startUrl];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

// 進むボタン
- (void)goForwardButtonClicked:(UIBarButtonItem *)sender {
    NSLog(@"forwardButtonClicked");
    [self.webView goForward];
}

// リロードボタンをクリックした場合
- (void)reloadButtonClicked:(UIBarButtonItem *)sender {
    NSLog(@"reloadButtonClicked");
    [self.webView reload];
}

// ページ読込開始時にインジケータをくるくるさせる
-(void)webViewDidStartLoad:(UIWebView*)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

// ページ読込完了時にインジケータを非表示にする
-(void)webViewDidFinishLoad:(UIWebView*)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    if(self.webView.canGoBack == YES){
        self.goBackButton.enabled = YES;
    }else{
        self.goBackButton.enabled = NO;
    }
    
    if(self.webView.canGoForward == YES){
        self.goForwardButton.enabled = YES;
    }else{
        self.goForwardButton.enabled = NO;
    }
}

@end
