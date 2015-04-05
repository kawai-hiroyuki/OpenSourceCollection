//
//  KHFSelectTopicViewController.h
//  SendMailSample
//
//  Created by obumin on 2014/09/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KHFSelectTopicViewControllerDelegate;

@interface KHFSelectTopicViewController : UITableViewController

@property (strong, nonatomic) NSArray *topics;
// 選択されたトピック
@property (nonatomic) NSString *selectedTopic;
// 処理のデリゲート先の参照
@property (weak, nonatomic) id<KHFSelectTopicViewControllerDelegate> delegate;

// インスタンスを取得する
+ (KHFSelectTopicViewController*)getInstance;
// 表示するために
- (void)setTopics:(NSArray *)newTopics;

@end

@protocol KHFSelectTopicViewControllerDelegate <NSObject>

- (void)applySelectedTopic:(NSString *)topic;

@end