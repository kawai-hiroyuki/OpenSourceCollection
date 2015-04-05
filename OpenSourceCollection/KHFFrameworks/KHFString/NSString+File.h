//
//  KHFString+File.h
//  KHFFrameworks
//
//  Created by obumin on 2014/11/21.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (File)

// filename : example.txt
// baseFilename : example
+ (NSString *)baseFilename:(NSString *)filename;

// filename : example.txt
// fileExtension : txt
+ (NSString *)fileExtension:(NSString *)filename;

@end
