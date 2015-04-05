//
//  MasterViewController.h
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/21.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSCAdTableViewController.h"
#import "KHFAdViewController.h"

@class OSCDetailViewController;


@interface OSCMasterViewController : KHFAdViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) OSCDetailViewController *detailViewController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightButtonItem;

// 設定ボタンが押されたときの処理
- (IBAction)settingButtonPressed:(id)sender;

@end

