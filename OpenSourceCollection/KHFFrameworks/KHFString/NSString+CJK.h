//
//  KHFString+HalfFull.h
//  KHFFrameworks
//
//  Created by obumin on 2014/11/21.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CJK)

// 全角から半角に変換する
+ (NSString *) fullToHalf:(NSString *)string;

// 半角から全角に変換する
+ (NSString *) halfToFull:(NSString *)string;

// ひらがなからカタカナに変換する
+ (NSString *) hiraToKata:(NSString *)string;

// カタカナをひらがなに変換する
+ (NSString *) kataToHira:(NSString *)string;
@end
