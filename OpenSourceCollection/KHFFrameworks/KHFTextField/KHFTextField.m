//
//  KHFTextField.m
//  TextFieldLikeButtonSample
//
//  Created by obumin on 2014/11/20.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFTextField.h"

@implementation KHFTextField

// Override
// rightViewのマージンを変更してアイコンが追加しても枠と重ならないように変更
- (CGRect) rightViewRectForBounds:(CGRect)bounds {
    
    CGRect textRect = [super rightViewRectForBounds:bounds];
    textRect.origin.x -= 10;
    return textRect;
}

// Override
// leftViewのマージンを変更してアイコンが追加しても枠と重ならないように変更
- (CGRect) leftViewRectForBounds:(CGRect)bounds {
    
    CGRect textRect = [super leftViewRectForBounds:bounds];
    textRect.origin.x += 10;
    return textRect;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
