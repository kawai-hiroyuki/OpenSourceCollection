//
//  OSCObject.h
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/25.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OSCObject : NSObject <NSCoding, NSCopying>

// タイトル
@property (strong, readonly, nonatomic) NSString *title;
// 説明
@property (strong, readonly, nonatomic) NSString *desc;
// 短い説明
@property (strong, readonly, nonatomic) NSString *shortdesc;
// コメント（画面には表示しない）
@property (strong, readonly, nonatomic) NSString *comment;

@property (strong, readonly, nonatomic) NSString *licenseType;

@property (strong, readonly, nonatomic) NSURL *licenseUrl;
// CocoaPods
@property (strong, readonly, nonatomic) NSString *cocoaPods;

@property (strong, readonly, nonatomic) NSString *howToUse;

@property (strong, readonly, nonatomic) NSString *version;

// サンプルコード
// "example":[
// {
//     "codeurl":"https://github.com/",
//     "viewcontroller":"EAIntroViewExample1ViewController"
// }]
@property (strong, readonly, nonatomic) NSArray *example;
// URL
@property (strong, readonly, nonatomic) NSURL *url;


@property (strong, readonly, nonatomic) NSArray *exampleCodeUrls;
@property (strong, readonly, nonatomic) NSArray *exampleViewControllers;

// インスタンスクラス
- (instancetype)initWithTitle:(NSString *)title
                  description:(NSString *)desc
                    shortdesc:(NSString *)shortdesc
                      comment:(NSString *)comment
                  licenseType:(NSString *)licenseType
                   licenseUrl:(NSURL *)licenseUrl
                    cocoaPods:(NSString *)cocoaPods
                     howToUse:(NSString *)howToUse
                      version:(NSString *)version
                      example:(NSArray *)example
                          url:(NSURL *)url;


- (NSString *)description;

@end
