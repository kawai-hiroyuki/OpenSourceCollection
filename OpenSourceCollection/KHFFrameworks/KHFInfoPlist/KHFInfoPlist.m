//
//  KHFInfoPlist.m
//  KHFFrameworks
//
//  Created by obumin on 2014/09/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFInfoPlist.h"

@interface KHFInfoPlist()
{
    NSDictionary *infoDictionary;
}
@end

@implementation KHFInfoPlist
/*
 * シングルトン処理
 * http://programming-ios.com/objective-c-singleton/
 */
+ (KHFInfoPlist*)sharedInstance {
    static KHFInfoPlist* sharedSingleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton = [[KHFInfoPlist alloc]
                           initSharedInstance];
    });
    return sharedSingleton;
}

- (id)initSharedInstance {
    self = [super init];
    if (self) {
        // 初期化処理
        infoDictionary = [[NSBundle mainBundle] infoDictionary];
    }
    return self;
}

- (id)init {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (BOOL)boolValueFromString:(NSString *)value
{
    NSLog(@"boolValue=%@", value);
    if ( [value intValue] ){
        return YES;
    }else{
        return NO;
    }
}

// CFBundleDevelopmentRegion
// string	アプリケーションのデフォルト言語
// デフォルト値は「en」（⇒Englishを表す）
- (NSString *)bundleDevelopmentRegion
{
    return [infoDictionary objectForKey:@"CFBundleDevelopmentRegion"];
}

// CFBundleDisplayName
// string iPhoneのホーム画面に表示される、アプリの名称
// デフォルト値は「${EXECUTABLE_NAME}」（⇒デフォルト値は、プロジェクト名称をアプリ名称とするようになっている）
- (NSString *)bundleDisplayName
{
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}

// CFBundleExecutable
// string	アプリケーションが実行可能なファイル
// デフォルト値は「${EXECUTABLE_NAME}」
- (NSString *)bundleExecutable
{
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}

// CFBundleIconFiles
// array	アプリのアイコンファイル名（拡張子も含む）
// iPhoneの320×480画面では57×57、
// iPhoneの640×960画面では114×114でアイコンを作成。
// iPadの768×1024画面では57×57、
// iPadの1536×2048画面では114×114でアイコンを作成。
- (NSArray *)bundleIconFiles
{
    return [infoDictionary objectForKey:@"CFBundleIconFiles"];
}

// CFBundleIdentifier
// string	アプリケーションを一意に認識するためのキー値
// uniform type identifier（UTI）となるように設定する
- (NSString *)bundleIdentifier
{
    return [infoDictionary objectForKey:@"CFBundleIdentifier"];
}

// CFBundleInfoDictionaryVersion
// string Info.plistの現在のバージョン値
- (NSString *)bundleInfoDictionaryVersion
{
    return [infoDictionary objectForKey:@"CFBundleInfoDictionaryVersion"];
}

// CFBundleName
// string	アプリケーションの短縮表示名を16文字以下で設定
// デフォルト値は「${PRODUCT_NAME}」
- (NSString *)bundleName
{
    return [infoDictionary objectForKey:@"CFBundleName"];
}

// CFBundlePackageType
// string	アプリケーションを識別する4文字のコード
// アプリケーションであれば「APPL」
- (NSString *)bundlePackageType
{
    return [infoDictionary objectForKey:@"CFBundlePackageType"];
}

// CFBundleShortVersionString
// string アプリケーションのリリースバージョン番号
// デフォルト値は1.0
- (NSString *)bundleShortVersionString
{
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

// CFBundleSignature
// string	アプリケーション開発者を識別するコード
// デフォルト値は？？？？
- (NSString *)bundleSignature
{
    return [infoDictionary objectForKey:@"CFBundleSignature"];
}

// CFBundleVersion
// string	アプリケーションのビルドバージョン番号
// デフォルト値は1.0
- (NSString *)bundleVersion
{
    return [infoDictionary objectForKey:@"CFBundleVersion"];
}

// LSRequiresIPhoneOS
// BOOL
// 当該アプリがiPhoneのみで実行可能なアプリであれば、trueを設定
- (BOOL)requiresIPhoneOS
{
    return [self boolValueFromString:[infoDictionary objectForKey:@"LSRequiresIPhoneOS"]];
}

// UIMainStoryboardFile
// string	メインのStoryboardファイルを設定（拡張子は記述しない）
// デフォルト値は「MainStoryboard」
- (NSString *)uiMainStoryboardFile
{
    return [infoDictionary objectForKey:@"UIMainStoryboardFile"];
}

// UIRequiredDeviceCapabilities
// array
// デバイスの制限（電話、WiFi、カメラ、加速度センサー、端末バージョンなどの動作有無）を設定
- (NSArray *)uiRequiredDeviceCapabilities
{
    return [infoDictionary objectForKey:@"UIRequiredDeviceCapabilities"];
}

// UIStatusBarHidden
// BOOL
// アプリケーション上部のステータスバーを非表示にする時、trueに設定
- (BOOL)uiStatusBarHidden
{
    return [self boolValueFromString:[infoDictionary objectForKey:@"UIStatusBarHidden"]];
}

// UISupportedInterfaceOrientations
// array
// アプリケーションがサポートする、デバイスの向き（画面の方向）を設定
- (NSArray *)uiSupportedInterfaceOrientations
{
    return [infoDictionary objectForKey:@"UISupportedInterfaceOrientations"];
}

@end
