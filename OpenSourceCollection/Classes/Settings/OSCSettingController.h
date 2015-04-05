//
//  OSCSettingController.h
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/05.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iRate.h"
#import "OSCIntroViewController.h"

@interface OSCSettingController : UIViewController <UITableViewDelegate, UITableViewDataSource, iRateDelegate, OSCIntroViewControllerDelegate>

@property (strong, nonatomic) UITableView *tableView;

// インスタンス
+ (OSCSettingController*)getInstance;

- (void)closeButtonPressed:(id)sender;

@end
