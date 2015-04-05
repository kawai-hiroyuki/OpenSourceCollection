//
//  KHFJson.m
//  JSONFromFile
//
//  Created by obumin on 2014/11/25.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFJson.h"

@implementation KHFJson

+ (id)loadFromFile:(NSString *)jsonFilePath
{
    NSData *data = [NSData dataWithContentsOfFile:jsonFilePath];
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:kNilOptions
                                                error:&error];
    return json;
}

+ (id)loadFromFile:(NSString *)jsonFilePath error:(NSError **)error
{
    NSData *data = [NSData dataWithContentsOfFile:jsonFilePath];
//    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:kNilOptions
                                                error:error];
    // エラーの場合はnilを返す
    if (error) return nil;
    
    return json;
}

@end
