//
//  OSCMasterViewController+JSON.m
//  OpenSourceCollection
//
//  Created by obumin on 2014/12/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "OSCMasterViewController+JSON.h"

@implementation OSCMasterViewController (JSON)

#pragma mark - JSON

- (NSArray *)sectionsFromJsonFilePath:(NSString *)jsonFilePath
{
    // 初期化
    NSMutableArray *sections = [[NSMutableArray alloc] init];
    NSDictionary *jsonDic = [KHFJson loadFromFile:jsonFilePath];
    
    // JSONファイルを解析する
    NSArray *ossArray = [jsonDic objectForKey:@"opensource"];
    for (NSDictionary *ossDict in ossArray) {
        NSString *category = ossDict[@"category"];
        NSLog(@"category=%@", category);
        // カテゴリをセクションに追加する
        [sections addObject:category];
    }
    return sections;
}


- (NSArray *)rowsFromJsonFilePath:(NSString *)jsonFilePath
{
    // 初期化
    NSMutableArray *rows = [[NSMutableArray alloc] init];
    NSDictionary *jsonDic = [KHFJson loadFromFile:jsonFilePath];
    
    // JSONファイルを解析する
    NSArray *ossArray = [jsonDic objectForKey:@"opensource"];
    for (NSDictionary *ossDict in ossArray) {
//        NSString *category = ossDict[@"category"];
        // カテゴリをセクションに追加する
//        [self.sectionArray addObject:category];
//        [self.sections addObject:category];
        
//        NSLog(@"category=%@", category);
        NSArray *list = ossDict[@"list"];
        
        NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in list) {
            NSString *licenseType = [dict[@"license"] objectForKey:@"licensetype"];
            NSURL *licenseUrl = [NSURL URLWithString:[dict[@"license"] objectForKey:@"licenseurl"]];
            NSArray *example = dict[@"example"];
            
            OSCObject *obj = [[OSCObject alloc] initWithTitle:dict[@"title"]
                                                  description:dict[@"desc"]
                                                    shortdesc:dict[@"shortdesc"]
                                                      comment:dict[@"comment"]
                                                  licenseType:licenseType
                                                   licenseUrl:licenseUrl
                                                    cocoaPods:dict[@"cocoapods"]
                                                     howToUse:dict[@"howtouse"]
                                                      version:dict[@"version"]
                                                      example:example
                                                          url:dict[@"url"]];
            
            [categoryArray addObject:obj];
        }
        [rows addObject:categoryArray];
    }
    return rows;
}

- (NSString *)localizedPathFromBundlePath:(NSString *)bundlePath filename:(NSString *)filename
{
    NSLog(@"bundlePath=%@", bundlePath);
    static NSBundle *bundle = nil;
    if (bundle == nil)
    {
        bundle = [NSBundle bundleWithPath:bundlePath];
        NSString *language = [[NSLocale preferredLanguages] count]? [NSLocale preferredLanguages][0]: @"en";
        if (![[bundle localizations] containsObject:language])
        {
            language = [language componentsSeparatedByString:@"-"][0];
        }
        if ([[bundle localizations] containsObject:language])
        {
            bundlePath = [bundle pathForResource:language ofType:@"lproj"];
        }
        
        bundle = [NSBundle bundleWithPath:bundlePath] ?: [NSBundle mainBundle];
    }
    
    return [bundle pathForResource:[KHFString baseFilename:filename]
                            ofType:[KHFString fileExtension:filename]];
}

- (NSArray *)rows
{
    return self.rows;
}

- (NSArray *)sections
{
    return self.sections;
}
@end
