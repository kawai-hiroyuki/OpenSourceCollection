//
//  KHFEmbedTextViewController.m
//  SettingViewController
//
//  Created by obumin on 2014/08/20.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFEmbedTextViewController.h"
#import "KHFString.h"

@interface KHFEmbedTextViewController () <UITextViewDelegate>

@end

@implementation KHFEmbedTextViewController

// インスタンス
+ (KHFEmbedTextViewController*)getInstance
{
    KHFEmbedTextViewController *vc = [[KHFEmbedTextViewController alloc] init];
    return vc;
}

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor whiteColor];
    //CGRect rect = [[UIScreen mainScreen] bounds];
    //self.view.frame = rect;
    
    self.textView = [[UITextView alloc] init];
    self.textView.frame = self.view.frame;
    // スクロール可
    self.textView.scrollEnabled = YES;
    // 編集不可
    self.textView.editable = NO;
    self.textView.delegate = self;
    [self.view addSubview:self.textView];
    
    NSLog(@"textfile=%@", self.textfile);
    NSString *filePath = [[NSBundle mainBundle]
                          pathForResource:[KHFString baseFilename:self.textfile]
                          ofType:[KHFString fileExtension:self.textfile]];
    NSError *error;
    self.textView.text = [[NSString alloc] initWithContentsOfFile:filePath
                                                         encoding:NSUTF8StringEncoding
                                                            error:&error];
    
     self.navigationController.toolbarHidden = NO;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // Toolbarを設定する
    self.navigationController.toolbarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
