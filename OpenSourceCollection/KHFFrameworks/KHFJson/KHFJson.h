//
//  KHFJson.h
//  JSONFromFile
//
//  Created by obumin on 2014/11/25.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHFJson : NSObject

// ファイルからJSONファイルを読み込む
+ (id)loadFromFile:(NSString *)jsonFilePath;
// ファイルからJSONファイルを読み込む（エラーメッセージ付）
+ (id)loadFromFile:(NSString *)jsonFilePath error:(NSError **)error;

@end
