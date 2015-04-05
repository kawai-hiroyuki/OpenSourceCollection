//
//  MasterViewController.m
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/21.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//
// http://stackoverflow.com/questions/9273364/how-to-build-app-with-ios-5-0-methods-for-ios-4-3
// System Versioning Preprocessor Macros
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#import "OSCMasterViewController.h"
#import "OSCDetailViewController.h"
#import "OSCObject.h"
#import "OSCSettingController.h"
#import "UIColor+OSC.h"
#import "OSCMasterViewController+JSON.h"
#import "OSCImage.h"

@interface OSCMasterViewController ()

@property NSArray *sectionArray;
@property NSArray *rowArray;

@end

@implementation OSCMasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
       
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[OSCImage imageNamed:@"logo"]];
    self.navigationController.navigationBar.tintColor = [UIColor appTintColor];
    
    _rightButtonItem.title = @"";
    UIImage *image = [OSCImage imageNamed:@"settings_filled"];
    _rightButtonItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    // 初期化
    if (!self.sectionArray) self.sectionArray = [[NSArray alloc] init];
    if (!self.rowArray) self.rowArray = [[NSArray alloc] init];
    
    // JSONファイルを読み込む
    NSString *fileName = @"osc.json";
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"OpenSourceCollection" ofType:@"bundle"];
    NSString *localizedJsonPath = [self localizedPathFromBundlePath:bundlePath filename:fileName];
    
    self.sectionArray = [self sectionsFromJsonFilePath:localizedJsonPath];
    self.rowArray = [self rowsFromJsonFilePath:localizedJsonPath];
    
    // Ad
    self.adType = KHFAdTypeAdmob;
    self.adUnitID = @"ca-app-pub-9519424358678937/1730643807";
    self.testDevices = @[@"a68dfad83a8b7fccf8b9efa35f05bc64",    // iPhone4
                            @"cfffc4d2341fca3cfba76c04f947d339",    // iPad mini
                            GAD_SIMULATOR_ID];                      // Simulator
    [self addAdViewAboveToolbar];
    
    // AdのHeightだけTableViewの余白をあける
    CGFloat adViewHeight = self.adView.frame.size.height;
    // UITableView のコンテンツに余白を付ける
    self.tableView.contentInset = UIEdgeInsetsMake(0.f, 0.f, adViewHeight, 0.f);
    // UITableView のスクロール可能範囲に余白を付ける
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0.f, 0.f, adViewHeight, 0.f);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark IBAction
// 設定ボタンが押されたときの処理
- (IBAction)settingButtonPressed:(id)sender
{
    NSLog(@"settingButtonClicked");
    
    OSCSettingController *viewController = [OSCSettingController getInstance];
    // Navigation Controllerに接続してから表示する
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationController.toolbarHidden = YES;
    
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
        // Xcode6での透過View
        // http://ushisantoasobu.hateblo.jp/entry/2014/09/12/023926
        navigationController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    } else {
        UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
        rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    }
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *objects = self.rowArray[section];
    return objects.count;
}

/**
 * 指定されたセクションのセクション名を返す
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionArray[section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSArray *objects = self.rowArray[indexPath.section];
    OSCObject *object = objects[indexPath.row];
    cell.textLabel.text = object.title;
    cell.detailTextLabel.text = object.shortdesc;
    
    UIImage *image = [OSCImage imageNamed:@"github"];
    cell.imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return cell;
}
//
//// セルを押したときの処理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *objects = self.rowArray[indexPath.section];
    OSCObject *object = objects[indexPath.row];
    NSLog(@"title=%@", object.title);
    
    OSCDetailViewController *vc = [OSCDetailViewController getInstance];
    [vc setObject:object];

    [self.navigationController pushViewController:vc animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// セルの色を設定する
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor tableViewBackgroundColor];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.imageView.tintColor = [UIColor appTintColor];
}

// セクションのラベルを設定する
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, tableView.frame.size.width, 18)];
    view.backgroundColor = [UIColor tableViewSectionViewBackgroundColor];
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textColor = [UIColor darkGrayColor];
    label.text = self.sectionArray[section];
    [view addSubview:label];
    return view;
}

// セルの高さを返す
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return 55.0f;
    return 70.0f;
}
@end
