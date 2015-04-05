//
//  KHFSelectTopicViewController.m
//  SendMailSample
//
//  Created by obumin on 2014/09/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFSelectTopicViewController.h"

@interface KHFSelectTopicViewController ()

@end

@implementation KHFSelectTopicViewController

// インスタンス
+ (KHFSelectTopicViewController*)getInstance
{
//    return [[UIStoryboard storyboardWithName:kFeedbackStoryBoard bundle:nil] instantiateViewControllerWithIdentifier:@"SelectTopicViewController"];
    return [[KHFSelectTopicViewController alloc] initWithStyle:UITableViewStyleGrouped];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setTopics:(NSArray *)newTopics
{
    if (_topics != newTopics) {
        _topics = newTopics;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.allowsSelection = YES;
    
    //topics = @[@"質問", @"リクエスト", @"バグ報告", @"マスメディア", @"ビジネス", @"その他"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//追加もしくは削除された後に動作する
// この方法だとトピックを選択して遷移元のViewControllerに戻ってから実行されるので
// Topicが切り替わるタイミングが遅れる。
// そこでviewWillDisapperにしたら丁度良いタイミングになった。
//- (void)didMoveToParentViewController:(UIViewController *)parent
//{
//    if (![parent isEqual:self.parentViewController]) {
//        NSLog(@"back %@", self.selectedTopic);
//        [self.delegate applySelectedTopic:self.selectedTopic];
//    }
//}

- (void)viewWillDisappear:(BOOL)animated
{
    if (![self.navigationController.viewControllers containsObject:self]) {
        //戻るを押された
        NSLog(@"back");
        [self.delegate applySelectedTopic:self.selectedTopic];
    }
    
    [super viewWillDisappear:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.topics count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"selectCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"selectCell" forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = self.topics[indexPath.row];
    
    return cell;
}

// http://mako-wis.hatenablog.com/entry/2014/03/07/110322
// セルが選択された時に呼び出される
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択を解除する
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 選択されたセルを取得
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // セルのアクセサリにチェックマークを指定
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    self.selectedTopic = self.topics[indexPath.row];
}

// セルの選択がはずれた時に呼び出される
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択がはずれたセルを取得
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // セルのアクセサリを解除する（チェックマークを外す）
    cell.accessoryType = UITableViewCellAccessoryNone;
}

@end
