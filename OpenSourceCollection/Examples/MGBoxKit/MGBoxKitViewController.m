//
//  ViewController.m
//  MGBoxSample
//
//  Created by obumin on 2014/11/21.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "MGBoxKitViewController.h"
#import "MGBoxKit.h"

@interface MGBoxKitViewController ()

@end

@implementation MGBoxKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MGScrollView *scroller = [MGScrollView scrollerWithSize:self.view.size];
    [self.view addSubview:scroller];
    
//    MGLine *header = [MGLine lineWithSize:(CGSize){320, 40}];
    MGLine *header = [MGLine lineWithSize:(CGSize){self.view.size.width, 40}];
    header.bottomBorderColor = UIColor.lightGrayColor;
    header.padding = UIEdgeInsetsMake(0, 16, 0, 16);
    header.leftItems = (id)@"This is a Heading";
    [scroller.boxes addObject:header];

    for (int i = 0; i < 10; i++) {
//        MGLine *row = [MGLine lineWithSize:(CGSize){320, 40}];
        MGLine *row = [MGLine lineWithSize:(CGSize){self.view.size.width, 40}];
        row.bottomBorderColor = UIColor.lightGrayColor;
        row.padding = UIEdgeInsetsMake(0, 16, 0, 16);
        row.leftItems = (id)[NSString stringWithFormat:@"Row Number %d", i];
        row.rightItems = (id)[UIImage imageNamed:@"chevron"];
        [scroller.boxes addObject:row];
    }
    
    [scroller layoutWithDuration:0.3 completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
