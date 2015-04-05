//
//  KHFSendMailViewController.m
//  SendMailSample
//
//  Created by obumin on 2014/09/01.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFSendMailViewController.h"

@interface KHFSendMailViewController ()

// メールの受取メールアドレス配列
@property (nonatomic) NSArray *toRecipients;

@end

@implementation KHFSendMailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Compose Mail/SMS

// -------------------------------------------------------------------------------
//	displayMailComposerSheet
//  Displays an email composition interface inside the application.
//  Populates all the Mail fields.
// -------------------------------------------------------------------------------
- (void)displayMailComposerSheetWithSubject:(NSString*)subject
                               toRecipients:(NSArray *)toRecipients
                               ccRecipients:(NSArray *)ccRecipients
                              bccRecipients:(NSArray *)bccRecipients
                                messageBody:(NSString *)messageBody
                                     isHTML:(BOOL)isHMTL
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:subject];
	
	[picker setToRecipients:toRecipients];
    if (ccRecipients) [picker setCcRecipients:ccRecipients];
    if (bccRecipients)[picker setBccRecipients:bccRecipients];
	
	[picker setMessageBody:messageBody isHTML:isHMTL];
	
	[self presentViewController:picker animated:YES completion:NULL];
}

- (void)displayMailComposerSheetWithSubject:(NSString*)subject
                               toRecipients:(NSArray *)toRecipients
                                messageBody:(NSString *)messageBody
{
    [self displayMailComposerSheetWithSubject:subject
                                 toRecipients:toRecipients
                                 ccRecipients:nil
                                bccRecipients:nil
                                  messageBody:messageBody
                                       isHTML:NO];
}


#pragma mark - Delegate Methods

// -------------------------------------------------------------------------------
//	mailComposeController:didFinishWithResult:
//  Dismisses the email composition interface when users tap Cancel or Send.
//  Proceeds to update the message field with the result of the operation.
// -------------------------------------------------------------------------------
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	self.feedbackMsg.hidden = NO;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			self.feedbackMsg.text = @"Result: Mail sending canceled";
			break;
		case MFMailComposeResultSaved:
			self.feedbackMsg.text = @"Result: Mail saved";
			break;
		case MFMailComposeResultSent:
			self.feedbackMsg.text = @"Result: Mail sent";
			break;
		case MFMailComposeResultFailed:
			self.feedbackMsg.text = @"Result: Mail sending failed";
			break;
		default:
			self.feedbackMsg.text = @"Result: Mail not sent";
			break;
	}
    
	[self dismissViewControllerAnimated:YES completion:NULL];
}

@end
