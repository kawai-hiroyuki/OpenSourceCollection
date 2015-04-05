//
//  IRateViewController.m
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/27.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "IRateViewController.h"
#import <iRate.h>

@interface IRateViewController ()

@end

@implementation IRateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self rate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Private Method
- (void)rate
{
    [[iRate sharedInstance] promptIfNetworkAvailable];
}

#pragma mark -
#pragma mark IBAction Method
- (IBAction)rateButtonPressed:(id)sender
{
    [self rate];
}

- (IBAction)closeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
