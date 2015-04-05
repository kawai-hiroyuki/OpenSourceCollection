//
//  KHFTextField.h
//  TextFieldLikeButtonSample
//
//  Created by obumin on 2014/11/20.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHFTextField : UITextField

// Override
// rightViewのマージンを変更してアイコンが追加しても枠と重ならないように変更
- (CGRect) rightViewRectForBounds:(CGRect)bounds;
// Override
// leftViewのマージンを変更してアイコンが追加しても枠と重ならないように変更
- (CGRect) leftViewRectForBounds:(CGRect)bounds;
@end
