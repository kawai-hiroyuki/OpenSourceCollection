//
//  UIDevice-HardwareTableViewController.m
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/27.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "UIDevice-HardwareTableViewController.h"
#import <UIDevice-Hardware.h>

@interface UIDevice_HardwareTableViewController ()
- (IBAction)closeButtonPressed:(id)sender;

@property (strong, nonatomic) NSArray *titleList;
@property (strong, nonatomic) NSArray *detailTextList;

@end

@implementation UIDevice_HardwareTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleList = @[@"Model Identifier", @"Model Name", @"Device Family"];
    
    NSString *modelIdentifier = [UIDevice currentDevice].modelIdentifier;
    NSString *modelName = [UIDevice currentDevice].modelName;
    
    NSString *deviceFamilyStr = nil;
    UIDeviceFamily deviceFamily = [UIDevice currentDevice].deviceFamily;
    switch (deviceFamily) {
        case UIDeviceFamilyiPhone:
            deviceFamilyStr = @"UIDeviceFamilyiPhone";
            break;
        case UIDeviceFamilyiPod:
            deviceFamilyStr = @"UIDeviceFamilyiPod";
            break;
        case UIDeviceFamilyiPad:
            deviceFamilyStr = @"UIDeviceFamilyiPad";
            break;
        case UIDeviceFamilyAppleTV:
            deviceFamilyStr = @"UIDeviceFamilyAppleTV";
            break;
        case UIDeviceFamilyUnknown:
            deviceFamilyStr = @"UIDeviceFamilyUnknown";
            break;
        default:
            break;
    }
    
    self.detailTextList = @[modelIdentifier, modelName, deviceFamilyStr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.titleList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"forIndexPath:indexPath];
    
    cell.textLabel.text = [self.titleList[indexPath.row] description];
    cell.detailTextLabel.text = [self.detailTextList[indexPath.row] description];
    return cell;
}

- (IBAction)closeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
