//
//  KHFSendMailDescriptionCell.h
//  SendMailSample
//
//  Created by obumin on 2014/09/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KHFSendMailDescriptionCell : UITableViewCell <UITextViewDelegate>

@property (strong, nonatomic) UITextView *textView;

+ (CGFloat)rowHeight;


@end
