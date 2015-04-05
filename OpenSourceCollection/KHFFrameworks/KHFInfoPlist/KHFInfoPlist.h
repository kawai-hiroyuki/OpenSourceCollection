//
//  KHFInfoPlist.h
//  KHFFrameworks
//
//  Created by obumin on 2014/09/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHFInfoPlist : NSObject

// インスタンスの作成（シングルトン）
+ (KHFInfoPlist*)sharedInstance;

// CFBundleDevelopmentRegion
// string	アプリケーションのデフォルト言語
// デフォルト値は「en」（⇒Englishを表す）
- (NSString *)bundleDevelopmentRegion;
// CFBundleDisplayName
// string iPhoneのホーム画面に表示される、アプリの名称
// デフォルト値は「${EXECUTABLE_NAME}」（⇒デフォルト値は、プロジェクト名称をアプリ名称とするようになっている）
- (NSString *)bundleDisplayName;
// CFBundleExecutable
// string アプリケーションが実行可能なファイル
// デフォルト値は「${EXECUTABLE_NAME}」
- (NSString *)bundleExecutable;
// CFBundleIconFiles
// array	アプリのアイコンファイル名（拡張子も含む）
// iPhoneの320×480画面では57×57、
// iPhoneの640×960画面では114×114でアイコンを作成。
// iPadの768×1024画面では57×57、
// iPadの1536×2048画面では114×114でアイコンを作成。
- (NSArray *)bundleIconFiles;
// CFBundleIdentifier
// string	アプリケーションを一意に認識するためのキー値
// uniform type identifier（UTI）となるように設定する
- (NSString *)bundleIdentifier;
// CFBundleInfoDictionaryVersion
// string Info.plistの現在のバージョン値
- (NSString *)bundleInfoDictionaryVersion;
// CFBundleName
// string	アプリケーションの短縮表示名を16文字以下で設定
// デフォルト値は「${PRODUCT_NAME}」
- (NSString *)bundleName;
// CFBundlePackageType
// string	アプリケーションを識別する4文字のコード
// アプリケーションであれば「APPL」
- (NSString *)bundlePackageType;
// CFBundleShortVersionString
// string アプリケーションのリリースバージョン番号
// デフォルト値は1.0
- (NSString *)bundleShortVersionString;
// CFBundleSignature
// string	アプリケーション開発者を識別するコード
// デフォルト値は？？？？
- (NSString *)bundleSignature;
// CFBundleVersion
// string	アプリケーションのビルドバージョン番号
// デフォルト値は1.0
- (NSString *)bundleVersion;
// LSRequiresIPhoneOS
// BOOL
// 当該アプリがiPhoneのみで実行可能なアプリであれば、trueを設定
- (BOOL)requiresIPhoneOS;
// UIMainStoryboardFile
// string	メインのStoryboardファイルを設定（拡張子は記述しない）
// デフォルト値は「MainStoryboard」
- (NSString *)uiMainStoryboardFile;
// UIRequiredDeviceCapabilities
// array
// デバイスの制限（電話、WiFi、カメラ、加速度センサー、端末バージョンなどの動作有無）を設定
- (NSArray *)uiRequiredDeviceCapabilities;
// UIStatusBarHidden
// BOOL
// アプリケーション上部のステータスバーを非表示にする時、trueに設定
- (BOOL)uiStatusBarHidden;

// UISupportedInterfaceOrientations
// array
// アプリケーションがサポートする、デバイスの向き（画面の方向）を設定
- (NSArray *)uiSupportedInterfaceOrientations;

@end
