//
//  OSCImage.h
//  OpenSourceCollection
//
//  Created by obumin on 2014/12/04.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OSCImage : UIImage

// BundleからImageを取得
+ (UIImage *)imageNamed:(NSString *)name;

@end
