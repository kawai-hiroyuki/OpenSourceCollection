//
//  KHFSendMailDescriptionCell.m
//  SendMailSample
//
//  Created by obumin on 2014/09/02.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFSendMailDescriptionCell.h"

@implementation KHFSendMailDescriptionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 7, self.contentView.frame.size.width, [KHFSendMailDescriptionCell rowHeight])];
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 7, self.contentView.frame.size.width, 50.0f)];
        self.textView.textAlignment = NSTextAlignmentLeft;
        self.textView.editable = YES;
        self.textView.delegate = self;
//        self.textView.
        [self.contentView addSubview:self.textView];
    }
    return self;
}

+ (CGFloat)rowHeight
{
    return 100.0f;
}

@end
