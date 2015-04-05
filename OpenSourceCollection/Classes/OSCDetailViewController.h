//
//  DetailViewController.h
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/21.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSCObject.h"
//#import "OSCAdTableViewController.h"
#import "KHFAdViewController.h"

@interface OSCDetailViewController : KHFAdViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) OSCObject *object;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

// インスタンスを取得する
+ (OSCDetailViewController*)getInstance;
@end

