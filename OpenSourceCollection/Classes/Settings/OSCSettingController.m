//
//  OSCSettingController.m
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/05.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "OSCSettingController.h"
#import "KHFEmbedWebViewController.h"
#import "KHFEmbedTextViewController.h"
#import "KHFFeedbackViewController.h"
#import "KHFInfoPlist.h"
#import "OSCStringConst.h"
#import "UIColor+OSC.h"

typedef NS_ENUM(NSInteger, SettingCell) {
//    SettingCellIntro = 0,
    SettingCellVersion,
//    SettingCellAboutDeveloper,
//    SettingCellOpenSourceLicence,
//    SettingCellCopyRight,
    SettingCellRate,
    SettingCellBugReport,
    SettingCellAmount,
};

@interface OSCSettingController ()

@end

@implementation OSCSettingController

// インスタンス
+ (OSCSettingController*)getInstance
{
    return [[OSCSettingController alloc] init];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"Setting", "OSCSettingController title");
    self.navigationController.navigationBar.tintColor = [UIColor appTintColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:NSLocalizedString(@"Close", @"")
                                              style:UIBarButtonItemStylePlain
                                              target:self action:@selector(closeButtonPressed:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark IBAction Method
- (void)closeButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    return SettingCellAmount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    NSString *title = nil;
    NSString *detailText = nil;
    switch ( indexPath.row )
    {
//        case SettingCellIntro:
//            title = NSLocalizedString(@"App Intro", @"Setting Cell Title(App Intro)");
//            break;
        case SettingCellVersion:
            cellIdentifier = @"versionCell";
            title = NSLocalizedString(@"App Version", @"Setting Cell Title(App Version)");
            detailText = [[KHFInfoPlist sharedInstance] bundleShortVersionString];
            break;
//        case SettingCellAboutDeveloper:
//            title = NSLocalizedString(@"About Developer", @"Setting Cell Title(About Developer)");
//            break;
//        case SettingCellOpenSourceLicence:
//            title = NSLocalizedString(@"Open Source Licence", @"Setting Cell Title(Open Source Licence)");
//            break;
//        case SettingCellCopyRight:
//            title = NSLocalizedString(@"Copy Right", @"Setting Cell Title(Copy Right)");
//            break;
        case SettingCellRate:
            title = NSLocalizedString(@"Rate This App", @"Setting Cell Title(Rate This App)");
            break;
        case SettingCellBugReport:
            title = NSLocalizedString(@"Bug Report", @"Setting Cell Title(Bug Report)");
            break;
        default:
            break;
    }
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        switch ( indexPath.row )
        {
            case SettingCellVersion:
                // Version
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                break;
            default:
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                break;
        }
        cell.textLabel.font = [UIFont boldSystemFontOfSize:18.f];
    }
    switch ( indexPath.row )
    {
        case SettingCellVersion:
            // Version
            cell.detailTextLabel.text = detailText;
            break;
//        case SettingCellOpenSourceLicence:
//        case SettingCellCopyRight:
        case SettingCellRate:
        case SettingCellBugReport:
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
    }
    cell.textLabel.text = title;
    cell.imageView.image = [UIImage imageNamed:@"settings"];
    
    return cell;
}

#pragma mark - UITableViewDelegate methods

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 50.0f;
//}


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *viewController = nil;
    KHFEmbedWebViewController *webVC = nil;
    KHFEmbedTextViewController *textVC = nil;
    KHFFeedbackViewController *feedbackVC = nil;
    UINavigationController *navigationController = nil;
    switch (indexPath.row) {
//        case SettingCellIntro:
//            [[OSCIntroViewController sharedInstance] showIntroPage:self.navigationController.view animateDuration:0.5];
//            break;
        case SettingCellVersion:
            // versionCell
            // nop
            break;
//        case SettingCellAboutDeveloper:
//            webVC = [KHFEmbedWebViewController getInstance];
//            [webVC setUrl:kDeveloperUrl];
//            [webVC setTitle:NSLocalizedString(@"Developer Site", @"Developer site title")];
//            viewController = (UIViewController *) webVC;
//            break;
//        case SettingCellOpenSourceLicence:
//            // ossCell
//            textVC = [KHFEmbedTextViewController getInstance];
//            textVC.textfile = kOSSLicenceTextFile;
//            [textVC setTitle:NSLocalizedString(@"Open Source Licence", @"open source title")];
//            viewController = (UIViewController *) textVC;
//            break;
//        case SettingCellCopyRight:
//            // copyRightCell
//            textVC = [KHFEmbedTextViewController getInstance];
//            textVC.textfile = kCopyrightTextFile;
//            [textVC setTitle:NSLocalizedString(@"Copy right", @"copyRight title")];
//            viewController = (UIViewController *) textVC;
//            break;
        case SettingCellRate:
            // rateCell
            //perform manual check
            [[iRate sharedInstance] promptIfNetworkAvailable];
            break;
        case SettingCellBugReport:
            // bugReportCell
            feedbackVC = [KHFFeedbackViewController getInstance];
            viewController = (UIViewController *) feedbackVC;
            // モーダル表示でもNavigationBarを表示するため
            navigationController =
            [[UINavigationController alloc] initWithRootViewController:viewController];
            // Toolbarを表示させる
            navigationController.toolbarHidden = NO;
            // モーダルを表示
            [self presentViewController:navigationController animated:YES completion: nil];
            return;
        default:
            break;
    }
    // Push the view controller.
    [self.navigationController pushViewController:viewController animated:YES];
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Version情報は選択不可にする
    // http://obc-fight.blogspot.OSC/2013/07/To-not-be-selected-specific-cells-of-UITableView.html
    if (indexPath.section == 0 && indexPath.row == SettingCellVersion)
        return nil;
    else
        return indexPath;
}



#pragma mark -
#pragma mark iRateDelegate methods

- (void)iRateCouldNotConnectToAppStore:(NSError *)error
{
    //    [label setStringValue:[error localizedDescription]];
    //    [progressIndicator stopAnimation:self];
}

- (BOOL)iRateShouldPromptForRating
{
    //don't show prompt, just open app store
    [[iRate sharedInstance] openRatingsPageInAppStore];
    //    [label setStringValue:@"Connected."];
    //    [progressIndicator stopAnimation:self];
    return NO;
}

#pragma mark -
#pragma mark OSCIntroViewControllerDelegate methods
- (void)introViewDidFinish:(EAIntroView *)introView
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}
@end
