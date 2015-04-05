//
//  KHFViewController.m
//  SendMailSample
//
//  Created by obumin on 2014/09/01.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFFeedbackViewController.h"
#import "KHFSendMailDescriptionCell.h"
#import "UIDevice-Hardware.h"
#import "KHFInfoPlist.h"
#import "KHFSelectTopicViewController.h"

@interface KHFFeedbackViewController ()  <UITableViewDelegate, UITableViewDataSource, KHFSelectTopicViewControllerDelegate>
{
    NSArray *sectionList;
    NSArray *keys;
    NSArray *values;
}
@end

@implementation KHFFeedbackViewController

// インスタンス
+ (KHFFeedbackViewController*)getInstance
{
    return [[KHFFeedbackViewController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                  style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.cancelButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Cancel", @"キャンセルボタン")
                                                         style:UIBarButtonItemStylePlain
                                                        target:self
                                                        action:@selector(cancelButtonPressed:)];
    self.navigationItem.leftBarButtonItem = self.cancelButton;
    
    self.sendMailButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Mail", @"メールボタン")
                                                         style:UIBarButtonItemStylePlain
                                                        target:self
                                                        action:@selector(sendButtonPressed:)];
    self.navigationItem.rightBarButtonItem = self.sendMailButton;
//    [self.cancelButton setTitle:NSLocalizedString(@"Cancel", @"キャンセルボタン")];
//    [self.sendMailButton setTitle:NSLocalizedString(@"Mail", @"メールボタン")];
    [self setTitle:NSLocalizedString(@"Feedback", @"Feedback title")];
    //self.tableView.allowsSelection = YES;

    // OS名を取得する
//    NSString *hardwareDescription = [[UIDevice currentDevice] hardwareDescription];
    NSString *hardwareDescription = [[UIDevice currentDevice] modelName];
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    NSString *appName = [[KHFInfoPlist sharedInstance] bundleName];
    NSString *appVersion = [[KHFInfoPlist sharedInstance] bundleShortVersionString];
    
    sectionList = @[NSLocalizedString(@"Please fill out necessary information", @"入力事項"),
                    NSLocalizedString(@"Operating Environment", @"動作環境の情報")];
    keys = @[NSLocalizedString(@"Device", @"Device"),
             NSLocalizedString(@"iOS", @"iOS"),
             NSLocalizedString(@"App Name", @"App Name"),
             NSLocalizedString(@"App Version", @"App Version")];
    //values = @[@"iPhone4", @"7.1.2", @"SendMail", @"1.00"];
    values = @[hardwareDescription, systemVersion, appName, appVersion];
    
    self.topics = @[NSLocalizedString(@"Question", @"質問"),
                    NSLocalizedString(@"Request", @"リクエスト"),
                    NSLocalizedString(@"Bug Report", @"バグ報告"),
                    NSLocalizedString(@"Mass media", @"マスメディア"),
                    NSLocalizedString(@"Business", @"ビジネス"),
                    NSLocalizedString(@"Etc", @"その他")
                    ];
    self.selectedTopic = self.topics[0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

#pragma mark IBAction Method
- (IBAction)sendButtonPressed:(id)sender {

    [self showMailPicker];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// -------------------------------------------------------------------------------
//	showMailPicker:
//  IBAction for the Compose Mail button.
// -------------------------------------------------------------------------------
- (void)showMailPicker
{
    // You must check that the current device can send email messages before you
    // attempt to create an instance of MFMailComposeViewController.  If the
    // device can not send email messages,
    // [[MFMailComposeViewController alloc] init] will return nil.  Your app
    // will crash when it calls -presentViewController:animated:completion: with
    // a nil view controller.
    if ([MFMailComposeViewController canSendMail])
        // The device can send email.
    {
        NSString *subject = NSLocalizedString(@"subject", @"KHFFeedbackViewController Mail Subject");
        NSArray *toRecipients = @[@"support@android.sub.jp"];
        NSMutableString *messageBody = [NSMutableString string];
        //[messageBody setStringWithEOL:@"messageBody"];
        [messageBody appendString:self.selectedTopic];
        [messageBody appendString:@"\n"];
        KHFSendMailDescriptionCell *cell = (KHFSendMailDescriptionCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        if (cell) {
            [messageBody appendString:cell.textView.text];
            [messageBody appendString:@"\n"];
        }
        for (int i=0; i < keys.count; i++) {
            [messageBody appendString:[NSString stringWithFormat:@"%@:%@\n", keys[i], values[i]]];
        }
        
        [self displayMailComposerSheetWithSubject:subject
                          toRecipients:toRecipients
                           messageBody:messageBody];
    }
    else
        // The device can not send email.
    {
        self.feedbackMsg.hidden = NO;
		self.feedbackMsg.text = @"Device not configured to send mail.";
    }
}

#pragma mark UITableViewDelegate
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [sectionList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 2;
    } else if (section == 1){
        return 4;
    } else {
        return 0;
    }
}

/**
 * 指定されたセクションのセクション名を返す
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionList objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = nil;
        UITableViewCell *topicCell = nil;
        KHFSendMailDescriptionCell *descriptionCell = nil;
        switch ( indexPath.row )
        {
            case 0:
                cellIdentifier = @"topicCell";
//                topicCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
                topicCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if(!topicCell) {
                    topicCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
                }
                topicCell.textLabel.text = NSLocalizedString(@"Topic", @"トピック");
                topicCell.detailTextLabel.text = self.selectedTopic;
                cell = (UITableViewCell *)topicCell;
                break;
            case 1:
                cellIdentifier = @"descriptionCell";
//                descriptionCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
                descriptionCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if(!descriptionCell) {
                    descriptionCell = [[KHFSendMailDescriptionCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
//                    descriptionCell.textView.delegate = self;
                }
//                descriptionCell.textView.placeholder = NSLocalizedString(@"I'd like to hear more details.", @"詳細をお願いいたします");
                cell = (UITableViewCell *)descriptionCell;
                break;
            default:
                break;
        }
        return cell;
    } else if(indexPath.section == 1) {
        cellIdentifier = @"deviceCell";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        }
        cell.textLabel.text = keys[indexPath.row];
        cell.detailTextLabel.text = values[indexPath.row];
        return cell;
    } else {
        return nil;
    }
}

#pragma mark - UITableViewDelegate methods




#pragma mark - Table view delegate
// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    // セル選択を解除する
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *viewController = nil;
    KHFSelectTopicViewController *topicVC = nil;
    
    switch (indexPath.row) {
        case 0:
            // topicCell
            topicVC = [KHFSelectTopicViewController getInstance];
            topicVC.delegate = self;
            topicVC.topics =  self.topics;
            viewController = (UIViewController *)topicVC;
            //viewController.delegate = self;
            break;
        default:
            break;
    }
    
    // モーダルを表示
    [self.navigationController pushViewController:viewController animated:YES];
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
        // 動作環境の情報セクションは選択不可にする
        // http://obc-fight.blogspot.jp/2013/07/To-not-be-selected-specific-cells-of-UITableView.html
        return nil;
    else if (indexPath.section == 0 && indexPath.row == 1)
        return nil;
    else
        return indexPath;
}

// セルの高さを決める
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight;
    if ([indexPath isEqual:[NSIndexPath indexPathForItem:1 inSection:0]]){
        rowHeight = 100.0f;
    }else {
        rowHeight = tableView.rowHeight;
    }
    return rowHeight;
}

#pragma mark KHFSelectTopicViewControllerDelegate
- (void)applySelectedTopic:(NSString *)topic
{
    NSLog(@"selectedTopic:%@", topic);
    self.selectedTopic = topic;
    [self.tableView reloadData];
}

@end
