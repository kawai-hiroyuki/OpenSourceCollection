//
//  KHFString+File.m
//  KHFFrameworks
//
//  Created by obumin on 2014/11/21.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "NSString+File.h"

@implementation NSString (File)

#pragma mark - filename

// filename : example.txt
// baseFilename : example
+ (NSString *)baseFilename:(NSString *)filename
{
    NSURL *url = [NSURL URLWithString:filename];
    // ベースファイル名 = ファイル名の文字数 - 拡張子の文字数 - コンマ（一文字）
    NSInteger length = [[url lastPathComponent] length] - [url pathExtension].length - 1;
    return [[url lastPathComponent] substringToIndex:length];
}

// filename : example.txt
// fileExtension : txt
+ (NSString *)fileExtension:(NSString *)filename
{
    NSURL *url = [NSURL URLWithString:filename];
    return [url pathExtension];
}

@end
