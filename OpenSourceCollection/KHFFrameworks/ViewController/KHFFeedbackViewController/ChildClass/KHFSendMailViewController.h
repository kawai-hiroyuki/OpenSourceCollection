//
//  KHFSendMailViewController.h
//  SendMailSample
//
//  Created by obumin on 2014/09/01.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface KHFSendMailViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error;

- (void)displayMailComposerSheetWithSubject:(NSString*)subject
                    toRecipients:(NSArray *)toRecipients
                    ccRecipients:(NSArray *)ccRecipients
                   bccRecipients:(NSArray *)bccRecipients
                     messageBody:(NSString *)messageBody
                          isHTML:(BOOL)isHMTL;

- (void)displayMailComposerSheetWithSubject:(NSString*)subject
                    toRecipients:(NSArray *)toRecipients
                     messageBody:(NSString *)messageBody;

// UILabel for displaying the result of the sending the message.
@property (nonatomic, weak) IBOutlet UILabel *feedbackMsg;


@end
