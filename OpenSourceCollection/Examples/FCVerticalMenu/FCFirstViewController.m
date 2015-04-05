//
//  FCFirstViewController.m
//  FCVerticalMenu
//
//  Created by Filippo Camillo on 23/10/14.
//  Copyright (c) 2014 Filippo Camillo. All rights reserved.
//

#import "FCFirstViewController.h"
#import "FCNavigationViewController.h"

@implementation FCFirstViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Menu", @"FCFirstViewController BarButtonItem") style:UIBarButtonItemStyleBordered target:self.navigationController action:@selector(openVerticalMenu:)];
}

- (IBAction)closeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
