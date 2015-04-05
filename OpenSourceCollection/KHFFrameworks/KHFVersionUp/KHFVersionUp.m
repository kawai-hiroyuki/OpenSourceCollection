//
//  KHFVersionUp.m
//  KHFVersionUpSample
//
//  Created by obumin on 2014/11/08.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFVersionUp.h"

@implementation KHFVersionUp

+ (BOOL)isVersionUp
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSNumber *oldVersion = [userDefault objectForKey:@"version"];
    NSUInteger iOldVersion = (oldVersion != nil) ? [oldVersion unsignedIntegerValue] : 0;
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleVersion"];
    NSUInteger iVersion = [KHFVersionUp integerVersion:currentVersion];
    if (iOldVersion < iVersion) {
        // バージョンアップしたらYESを返す
        return YES;
    }
    return NO;
}


+ (void)finishVersionUpExec
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleVersion"];
    NSUInteger iVersion = [KHFVersionUp integerVersion:currentVersion];
    [userDefault setInteger:iVersion forKey:@"version"];
    [userDefault synchronize];
}


/**
 比較しやすいように数値にする
 ver 1.2.3.4 => 1020304
 */
+ (NSUInteger)integerVersion:(NSString *)version {
    NSUInteger iVersion = 0;
    NSArray *verArray = [version componentsSeparatedByString:@"."];
    for (int i=0; i<verArray.count; i++) {
        NSString *ver = [verArray objectAtIndex:i];
        iVersion += [ver longLongValue] * ((NSUInteger)pow(100, (3-i)));
    }
    return iVersion;
}


@end
