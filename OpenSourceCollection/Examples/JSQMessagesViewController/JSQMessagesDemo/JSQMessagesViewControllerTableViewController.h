//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "DemoMessagesViewController.h"

@interface JSQMessagesViewControllerTableViewController : UITableViewController <JSQDemoViewControllerDelegate>

- (IBAction)unwindSegue:(UIStoryboardSegue *)sender;

- (IBAction)closeButtonPressed:(id)sender;
@end
