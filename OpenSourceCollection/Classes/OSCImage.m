//
//  OSCImage.m
//  OpenSourceCollection
//
//  Created by obumin on 2014/12/04.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "OSCImage.h"

@implementation OSCImage

+ (UIImage *)imageNamed:(NSString *)name
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"OpenSourceCollection.bundle/Image/%@", name]];
}

@end
