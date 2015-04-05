//
//  KHFString+HalfFull.m
//  KHFFrameworks
//
//  Created by obumin on 2014/11/21.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//
//  参考サイト
//  iOS6.0で発生するCFStringTransformの誤変換を回避するバッドノウハウ
//  https://gist.github.com/kamukiriri/4154646

#import "NSString+CJK.h"

@implementation NSString (CJK)

// 全角から半角に変換する
+ (NSString *) fullToHalf:(NSString *)string {
    NSMutableString *fstr = [NSMutableString stringWithString:string];
    NSLog(@"full-> %@", fstr);
    CFStringTransform((__bridge CFMutableStringRef)fstr, NULL, kCFStringTransformFullwidthHalfwidth, false);
    NSLog(@"half   %@", fstr);
    return fstr;
}

// 半角から全角に変換する
+ (NSString *) halfToFull:(NSString *)string {
    NSMutableString *hstr = [NSMutableString stringWithString:string];
    NSLog(@"half-> %@", hstr);
    CFStringTransform((__bridge CFMutableStringRef)hstr, NULL, kCFStringTransformFullwidthHalfwidth, true);
    NSLog(@"full   %@", hstr);
    return hstr;
}

// ひらがなからカタカナに変換する
+ (NSString *) hiraToKata:(NSString *)string {
    NSMutableString *hstr = [NSMutableString stringWithString:string];
    NSLog(@"Hira-> %@", hstr);
    CFStringTransform((__bridge CFMutableStringRef)hstr, NULL, kCFStringTransformHiraganaKatakana, false);
    NSLog(@"Kata   %@", hstr);
    return hstr;
}

// カタカナをひらがなに変換する
+ (NSString *) kataToHira:(NSString *)string {
    NSMutableString *hstr = [NSMutableString stringWithString:string];
    NSLog(@"Kata-> %@", hstr);
    CFStringTransform((__bridge CFMutableStringRef)hstr, NULL, kCFStringTransformHiraganaKatakana, true);
    NSLog(@"Hira   %@", hstr);
    return hstr;
}
@end
