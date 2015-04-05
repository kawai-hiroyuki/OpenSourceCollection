//
//  ViewController.m
//  KBRoundedButtonSample
//
//  Created by obumin on 2014/11/27.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KBRoundedButtonViewController.h"
#import <KBRoundedButton.h>

@interface KBRoundedButtonViewController ()

@end

@implementation KBRoundedButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(KBRoundedButton *)sender {
    sender.selected = !sender.selected;
}

- (IBAction)loginButtonPushed:(KBRoundedButton *)sender {
    sender.working = YES;
    sender.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.working = NO;
        sender.enabled = YES;
    });
}

- (IBAction)closeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
