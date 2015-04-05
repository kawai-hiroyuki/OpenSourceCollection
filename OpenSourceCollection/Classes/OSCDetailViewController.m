//
//  OSCDetailViewController.m
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/21.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "OSCDetailViewController.h"
#import "KHFEmbedWebViewController.h"
#import "UIColor+OSC.h"
#import "OSCImage.h"
#import "OSCStringConst.h"

#define kDetailViewCellTitle 100
#define kDetailViewCellDesc  200
#define kDetailViewCellVersion   300
#define kDetailViewCellExample1  400
#define kDetailViewCellExample2  500
#define kDetailViewCellExample3  600
#define kDetailViewCellHowToUse  700
#define kDetailViewCellLicense   800
#define kDetailViewCellCocoaPods 900
#define kDetailViewCellUrl   999


#define kCellIdentifier   @"CellIdentifier"
#define kText   @"Text"
#define kDetailText   @"DetailText"
#define kImage   @"Image"

#define kCellIdentifierTitle        @"TitleCell"
#define kCellIdentifierDesc         @"DescCell"
#define kCellIdentifierLicense      @"LicenseCell"
#define kCellIdentifierCocoaPods    @"CocoaPodsCell"
#define kCellIdentifierHowToUse     @"HowToUseCell"
#define kCellIdentifierVersion      @"VersionCell"
#define kCellIdentifierExample      @"ExampleCell"
#define kCellIdentifierUrl          @"UrlCell"

@interface OSCDetailViewController ()

@property (strong, nonatomic) NSMutableArray *cellItems;
@property (strong, nonatomic) NSMutableArray *cellList;
@end

@implementation OSCDetailViewController

#pragma mark - Managing the detail item

+ (OSCDetailViewController*)getInstance
{
    return [[UIStoryboard storyboardWithName:kMainStoryBoard bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([OSCDetailViewController class])];
}

- (void)setObject:(OSCObject *)object {
    if (_object != object) {
        _object = object;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.object) {

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Objective-C - iOS8でUITableViewのseparatorInsetに値をセットしても上手く行かない場合の対処法 - Qiita
    // http://qiita.com/uebo/items/f9e850c2eef13eb62495
    self.tableView.separatorInset = UIEdgeInsetsZero;
    if ([self.tableView respondsToSelector:@selector(layoutMargins)]) {
        self.tableView.layoutMargins = UIEdgeInsetsZero;
    }
    
    [self configureView];
    
    // Ad
    self.adType = KHFAdTypeAdmob;
    self.adUnitID = @"ca-app-pub-9519424358678937/3207377009";
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
    
    // この順番でCellが並ぶ
    [self addCellList:kDetailViewCellTitle];
    [self addCellList:kDetailViewCellDesc];
    [self addCellList:kDetailViewCellVersion];
    [self addCellList:kDetailViewCellExample1];
    [self addCellList:kDetailViewCellExample2];
    [self addCellList:kDetailViewCellExample3];
//    [self addCellList:kDetailViewCellHowToUse];
    [self addCellList:kDetailViewCellLicense];
//    [self addCellList:kDetailViewCellCocoaPods];
    [self addCellList:kDetailViewCellUrl];
    NSLog(@"CellList=%@", _cellList);
    
    [self insertNewObject];
}

//
- (void)addCellList:(int)integer
{
    if (!_cellList) {
        _cellList = [[NSMutableArray alloc] init];
    }
    NSLog(@"count=%lu", (unsigned long)[self.object.exampleViewControllers count]);
    switch (integer) {
        case kDetailViewCellExample1:
            if ([self.object.exampleViewControllers count] < 1) return;
            break;
        case kDetailViewCellExample2:
            if ([self.object.exampleViewControllers count] < 2) return;
            break;
        case kDetailViewCellExample3:
            if ([self.object.exampleViewControllers count] < 3) return;
            break;
        default:
            break;
    }
    // intではNSArrayに入れられないためNSNumberに変換
    [_cellList addObject:[NSNumber numberWithInteger:integer]];
}

- (void)insertNewObject {

    if (!self.cellItems) {
        self.cellItems = [[NSMutableArray alloc] init];
    }
    
    for (int i=0; i < [_cellList count]; i++) {
        NSDictionary *dict = nil;
        // NSNumberからintに戻す処理
        int s = [_cellList[i] intValue];
        switch (s) {
            case kDetailViewCellTitle:
                dict = @{kCellIdentifier:kCellIdentifierTitle, kText:self.object.title, kDetailText:@"", kImage:@"github"};
                break;
            case kDetailViewCellDesc:
                dict = @{kCellIdentifier:kCellIdentifierDesc, kText:self.object.desc, kDetailText:@"", kImage:@"about"};
                break;
            case kDetailViewCellVersion:
                dict = @{kCellIdentifier:kCellIdentifierVersion, kText:NSLocalizedString(@"Version", @"DetailView Version"), kDetailText:self.object.version, kImage:@"active_directory"};
                break;
            case kDetailViewCellExample1:
                    dict = @{
                             kCellIdentifier:kCellIdentifierExample,
                             kText:NSLocalizedString(@"Example1", @"DetailView Example1"),
                             kDetailText:self.object.exampleViewControllers[0],
                             kImage:@"idea"};
                break;
            case kDetailViewCellExample2:
                    dict = @{
                             kCellIdentifier:kCellIdentifierExample,
                             kText:NSLocalizedString(@"Example2", @"DetailView Example2"),
                             kDetailText:self.object.exampleViewControllers[1],
                             kImage:@"idea"};
                break;
            case kDetailViewCellExample3:
                    dict = @{
                             kCellIdentifier:kCellIdentifierExample,
                             kText:NSLocalizedString(@"Example3", @"DetailView Example3"),
                             kDetailText:self.object.exampleViewControllers[2],
                             kImage:@"idea"};
                break;
            case kDetailViewCellHowToUse:
                dict = @{kCellIdentifier:kCellIdentifierHowToUse, kText:NSLocalizedString(@"How To Use", @"DetailView HowToUse"), kDetailText:self.object.howToUse,
                    kImage:@"github"};
                break;
            case kDetailViewCellLicense:
                dict = @{kCellIdentifier:kCellIdentifierLicense, kText:NSLocalizedString(@"License", @"DetailView License"), kDetailText:self.object.licenseType,
                kImage:@"passport"};
                break;
            case kDetailViewCellCocoaPods:
                dict = @{kCellIdentifier:kCellIdentifierCocoaPods, kText:NSLocalizedString(@"CocoaPods", @"DetailView CocoaPods"), kDetailText:self.object.cocoaPods,
                         kImage:@"github"};
                break;
            case kDetailViewCellUrl:
                NSLog(@"url=%@", self.object.url);
                dict = @{kCellIdentifier:kCellIdentifierUrl, kText:NSLocalizedString(@"Website", @"DetailView Website"), kDetailText:[self.object.url description],
                    kImage:@"domain"};
                break;
            default:
                break;
        }
        
        // データがある場合は
        if (dict != nil) {
            NSLog(@"kCellIdentifier=%@ kText=%@ kDetailText=%@", dict[kCellIdentifier], dict[kText], dict[kDetailText]);
            
            [self.cellItems insertObject:dict atIndex:i];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // Toolbarを設定する
    self.navigationController.toolbarHidden = YES;
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellItems count];
}

// セルの高さを決める
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight;
    
    if ([self.cellList[indexPath.row] intValue] == kDetailViewCellDesc){
//    if ([indexPath isEqual:[NSIndexPath indexPathForItem:1 inSection:0]]) {
        // 表示したい文字列
//        NSString     *text = _objects[indexPath.row];
        NSString     *text = self.object.desc;
        // 表示最大幅・高さ
        CGSize     maxSize = CGSizeMake(200, CGFLOAT_MAX);
        // 表示するフォントサイズ
        NSDictionary *attr = @{NSFontAttributeName: [UIFont systemFontOfSize:17.0]};
        //NSDictionary *attr = nil;
        // 以上踏まえた上で、表示に必要なサイズ
        CGSize modifiedSize = [text boundingRectWithSize:maxSize
                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                              attributes:attr
                                                 context:nil
                               ].size;
        // 上下10pxずつの余白を加えたものと70pxのうち、大きい方を返す
        rowHeight = MAX(modifiedSize.height, 70);
    } else {
//        rowHeight = tableView.rowHeight;
        rowHeight = 70.0f;
    }
    return rowHeight;
}

///**
// * 指定されたセクションのセクション名を返す
// */
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return self.sectionTitle[[self.sectionList objectAtIndex:section]];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = nil;
    
    NSDictionary *dict = self.cellItems[indexPath.row];
    cellIdentifier = dict[kCellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if([dict[kText] length] != 0) cell.textLabel.text = dict[kText];
    if([dict[kDetailText] length] != 0) cell.detailTextLabel.text = dict[kDetailText];
    
    if ([cellIdentifier isEqualToString:kCellIdentifierDesc]) {
            // 複数行表示できるようにする処理
            cell.textLabel.numberOfLines = 100;
    }
    
    UIImage *image = [OSCImage imageNamed:dict[kImage]];
    cell.imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    // Objective-C - iOS8でUITableViewのseparatorInsetに値をセットしても上手く行かない場合の対処法 - Qiita
    // http://qiita.com/uebo/items/f9e850c2eef13eb62495
    UIEdgeInsets insets = self.tableView.contentInset;
    insets.left += 15;
    cell.separatorInset = insets;
    if ([cell respondsToSelector:@selector(layoutMargins)]) {
        cell.layoutMargins = insets;
    }
    
    return cell;
}

// セルを押したときの処理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = nil;
    int s = [self.cellList[indexPath.row] intValue];
    switch (s) {
        case kDetailViewCellExample1:
            className = self.object.exampleViewControllers[0];
            break;
        case kDetailViewCellExample2:
            className = self.object.exampleViewControllers[1];
            break;
        case kDetailViewCellExample3:
            className = self.object.exampleViewControllers[2];
            break;
        default:
            break;
    }
    NSLog(@"classname=%@", className);
    [self presentExampleViewController:className animated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

// nilを返すとその行は選択不可になる
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // nilを返すと選択不可にする
    // http://obc-fight.blogspot.jp/2013/07/To-not-be-selected-specific-cells-of-UITableView.html
    int s = [self.cellList[indexPath.row] intValue];
    switch (s) {
        case kDetailViewCellExample1:
        case kDetailViewCellExample2:
        case kDetailViewCellExample3:
            return indexPath;
        default:
            return nil;
    }
}

// セルの色を設定する
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor tableViewBackgroundColor];
    cell.imageView.tintColor = [UIColor appTintColor];
    // iOS - UITableViewCellのaccessoryViewの色を変える - Qiita
    // http://qiita.com/kuniorock/items/20ff0d0ab6f32b010e7b
    cell.tintColor = [UIColor appTintColor];
    
    int s = [self.cellList[indexPath.row] intValue];
    switch (s) {
        case kDetailViewCellExample1:
        case kDetailViewCellExample2:
        case kDetailViewCellExample3:
            cell.textLabel.textColor = [UIColor appTintColor];
            cell.backgroundColor = [UIColor exampleCellBackgroundColor];
//            cell.imageView.tintColor = [UIColor appTintColor];
        default:
            break;
    }
}

// アクセサリービューをタップしたとき
- (void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    KHFEmbedWebViewController  *webVC = nil;
    int s = [self.cellList[indexPath.row] intValue];
    switch (s) {
        case kDetailViewCellLicense:
            webVC = [KHFEmbedWebViewController getInstance];
            [webVC setUrl:[self.object.licenseUrl description]];
            [self.navigationController pushViewController:webVC animated:YES];
            break;
        case kDetailViewCellUrl:
            webVC = [KHFEmbedWebViewController getInstance];
            [webVC setUrl:[self.object.url description]];
            [self.navigationController pushViewController:webVC animated:YES];
            break;
        default:
            break;
    }
            
}

#pragma mark -
#pragma mark Private Method
- (void)presentExampleViewController:(NSString *)className animated:(BOOL)animated completion:(void (^)(void))completion
{
    @try {
        // ここでStoryboardがなかった場合は@catchへ移動してxibファイルからViewContollerを取得する
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:className bundle:nil];
        
        NSLog(@"Exist Storyboard");
        // Storyboardがある場合はStoryboardからViewControllerを生成
        if (storyboard) {
            id instance = [storyboard instantiateInitialViewController];
            if ([instance isKindOfClass:[UIViewController class]]) {
                // UIViewControllerの場合はModalで表示する
                [self presentViewController:instance animated:animated completion:completion];
            }
        }
        return;
    }@catch (NSException *exception) {
        // Storyboardがない場合は、nibファイルを使用する
        NSLog(@"No Storyboard");
        if (NSClassFromString(className)) {
            Class aClass = NSClassFromString(className);
            id instance = [[aClass alloc] init];
            
            if ([instance isKindOfClass:[UIViewController class]]) {
                
                [self presentViewController:instance animated:animated completion:completion];
            }
        }
    }
}

@end
