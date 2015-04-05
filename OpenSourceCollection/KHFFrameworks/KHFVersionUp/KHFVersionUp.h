//
//  KHFVersionUp.h
//  KHFVersionUpSample
//
//  Created by obumin on 2014/11/08.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHFVersionUp : NSObject
// アプリがバージョンアップしたかをチェックする
//
// if ([KHFVersionUp isVersionUp]) {
//     NSLog(@"version up");
// }
//
+ (BOOL)isVersionUp;

// バージョンアップ処理が終了したときに呼ぶ
// 現在のバージョンを最新のものにする
// これを呼ばないと次回もバージョンアップ処理が実行される
+ (void)finishVersionUpExec;

@end
