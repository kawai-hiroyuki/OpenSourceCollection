//
//  OSCObject.m
//  OpenSourceCollection
//
//  Created by obumin on 2014/11/25.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "OSCObject.h"

@interface OSCObject ()

@property (strong, readwrite, nonatomic) NSArray *exampleCodeUrls;
@property (strong, readwrite, nonatomic) NSArray *exampleViewControllers;

@end

@implementation OSCObject

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
                          url:(NSURL *)url
{
    self = [super init];
    if (self) {
        _title = title;
        _desc = desc;
        _shortdesc = shortdesc;
        _comment = comment;
        _licenseType = licenseType;
        _licenseUrl = licenseUrl;
        _cocoaPods = cocoaPods;
        _howToUse = howToUse;
        _version = version;
        _example = example;
        _url = url;
        
        
        [self configureExample:example];
    }
    return self;
}

// タイトルを返す
- (NSString *)description;
{
    return self.title;
}

// example配列の"codeurl"と"viewcontroller"
- (void)configureExample:(NSArray *)example
{
    NSArray *array = example;
    
    NSMutableArray *codeUrls = [[NSMutableArray alloc] init];
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in array) {
        // "codeurl": "https://github.com/ealeksandrov/EAIntroView/tree/master/EAIntroView",
        // "viewcontroller": "EAIntroViewController"
        [codeUrls addObject:dict[@"codeurl"]];
        [viewControllers addObject:dict[@"viewcontroller"]];
    }
    
    self.exampleCodeUrls = [codeUrls copy];
    self.exampleViewControllers = [viewControllers copy];
}


#pragma mark - Coping
// [CSPlaceDetail copy]の内部実装メソッド、データをDeep Copyして返す
// 詳細Objective-C 2.0 第3版 p.322を参照
-(id)copyWithZone:(NSZone *)zone
{
    OSCObject *tmpcopy = [[[self class] allocWithZone:zone] init];
    if (tmpcopy) {
        tmpcopy->_title = _title;
        tmpcopy->_desc = [_desc copyWithZone:zone];
        tmpcopy->_shortdesc = [_shortdesc copyWithZone:zone];
        tmpcopy->_comment = [_comment copyWithZone:zone];
        tmpcopy->_licenseType = [_licenseType copyWithZone:zone];
        tmpcopy->_licenseUrl = [_licenseUrl copyWithZone:zone];
        tmpcopy->_cocoaPods = [_cocoaPods copyWithZone:zone];
        tmpcopy->_howToUse = [_howToUse copyWithZone:zone];
        tmpcopy->_version = [_version copyWithZone:zone];
        tmpcopy->_example = [_example copyWithZone:zone];
        tmpcopy->_url = [_url copyWithZone:zone];
    }
    return tmpcopy;
}

#pragma mark - Encoding/Decoding

static NSString *TitleKey = @"TitleKey";
static NSString *DescKey = @"DescKey";
static NSString *ShortDescKey = @"ShortDescKey";
static NSString *CommentKey = @"CommentKey";
static NSString *LicenseTypeKey = @"LicenseTypeKey";
static NSString *LicenseUrlKey = @"LicenseUrlKey";
static NSString *CocoaPodsKey = @"CocoaPodsKey";
static NSString *HowToUseKey = @"HowToUseKey";
static NSString *VersionKey = @"VersionKey";
static NSString *ExampleKey = @"ExampleKey";
static NSString *UrlKey = @"UrlKey";

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _title = [aDecoder decodeObjectForKey:TitleKey];
        _desc = [aDecoder decodeObjectForKey:DescKey];
        _shortdesc = [aDecoder decodeObjectForKey:ShortDescKey];
        _comment = [aDecoder decodeObjectForKey:CommentKey];
        _licenseType = [aDecoder decodeObjectForKey:LicenseTypeKey];
        _licenseUrl = [aDecoder decodeObjectForKey:LicenseUrlKey];
        _cocoaPods = [aDecoder decodeObjectForKey:CocoaPodsKey];
        _howToUse = [aDecoder decodeObjectForKey:HowToUseKey];
        _version = [aDecoder decodeObjectForKey:VersionKey];
        _example = [aDecoder decodeObjectForKey:ExampleKey];
        _url = [aDecoder decodeObjectForKey:UrlKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:TitleKey];
    [aCoder encodeObject:self.desc forKey:DescKey];
    [aCoder encodeObject:self.shortdesc forKey:ShortDescKey];
    [aCoder encodeObject:self.comment forKey:CommentKey];
    [aCoder encodeObject:self.licenseType forKey:LicenseTypeKey];
    [aCoder encodeObject:self.licenseUrl forKey:LicenseUrlKey];
    [aCoder encodeObject:self.cocoaPods forKey:CocoaPodsKey];
    [aCoder encodeObject:self.howToUse forKey:HowToUseKey];
    [aCoder encodeObject:self.version forKey:VersionKey];
    [aCoder encodeObject:self.example forKey:ExampleKey];
    [aCoder encodeObject:self.url forKey:UrlKey];
}


@end