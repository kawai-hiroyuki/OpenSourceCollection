//
//  KHFViewController.h
//  SendMailSample
//
//  Created by obumin on 2014/09/01.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KHFSendMailViewController.h"

@interface KHFFeedbackViewController : KHFSendMailViewController

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIBarButtonItem *cancelButton;
@property (strong, nonatomic) UIBarButtonItem *sendMailButton;
@property (strong, nonatomic) NSArray *topics;
@property (nonatomic) NSString *selectedTopic;

// 送信ボタンを押したときの処理
- (IBAction)sendButtonPressed:(id)sender;
// キャンセルボタンを押したときの処理
- (IBAction)cancelButtonPressed:(id)sender;
// インスタンスを取得する
+ (KHFFeedbackViewController *)getInstance;

@end
