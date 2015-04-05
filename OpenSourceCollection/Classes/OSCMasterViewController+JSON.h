//
//  OSCMasterViewController+JSON.h
//  OpenSourceCollection
//
//  Created by obumin on 2014/12/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "OSCMasterViewController.h"
#import "KHFJson.h"
#import "KHFString.h"
#import "OSCObject.h"

@interface OSCMasterViewController (JSON)

// セクションの配列を取得する
- (NSArray *)sectionsFromJsonFilePath:(NSString *)jsonFilePath;
// 行の配列を取得する
- (NSArray *)rowsFromJsonFilePath:(NSString *)jsonFilePath;

- (NSString *)localizedPathFromBundlePath:(NSString *)bundlePath filename:(NSString *)filename;

@end
