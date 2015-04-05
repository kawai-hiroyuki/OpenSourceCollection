//
//  FCThirdViewController.m
//  FCVerticalMenu
//
//  Created by Filippo Camillo on 24/10/14.
//  Copyright (c) 2014 Filippo Camillo. All rights reserved.
//

#import "FCThirdViewController.h"
#import "FCNavigationViewController.h"

@implementation FCThirdViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Menu", @"FCThirdViewController BarButtonItem") style:UIBarButtonItemStyleBordered target:self.navigationController action:@selector(openVerticalMenu:)];
}

- (IBAction)closeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
