//
//  KYCircleMenuNavigationController.m
//  KYCircleMenuDemo
//
//  Created by obumin on 2014/11/28.
//  Copyright (c) 2014年 Kjuly. All rights reserved.
//

#import "KYCircleMenuNavigationController.h"

@interface KYCircleMenuNavigationController ()

@end

@implementation KYCircleMenuNavigationController

- (void)viewDidAppear:(BOOL)animated
{
    // Setup circle menu with basic configuration
    CircleMenuViewController * circleMenuViewController;
    circleMenuViewController = [CircleMenuViewController alloc];
    (void)[circleMenuViewController initWithButtonCount:kKYCCircleMenuButtonsCount
                                               menuSize:kKYCircleMenuSize
                                             buttonSize:kKYCircleMenuButtonSize
                                  buttonImageNameFormat:kKYICircleMenuButtonImageNameFormat
                                       centerButtonSize:kKYCircleMenuCenterButtonSize
                                  centerButtonImageName:kKYICircleMenuCenterButton
                        centerButtonBackgroundImageName:kKYICircleMenuCenterButtonBackground];
    
    // Set the cricle menu vc as the root vc
    [self pushViewController:circleMenuViewController animated:NO];
    [self.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
