//
//  ViewController.m
//  WSCoachMarksViewSample
//
//  Created by obumin on 2014/11/27.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "WSCoachMarksViewController.h"
#import <WSCoachMarksView.h>

@interface WSCoachMarksViewController ()

@property (strong, nonatomic) WSCoachMarksView *coachMarksView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISwitch *uiswitch;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIButton *demoStartButton;

- (IBAction)showCoachMarkButtonPressed:(id)sender;

- (IBAction)closeButtonPressed:(id)sender;
@end

@implementation WSCoachMarksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self configureCoachMarksView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Viewのサイズにマージンを足したNSValue(CGRect)を返す
- (NSValue *)frameSizeWithView:(UIView *)view margin:(float)margin
{
    return [NSValue valueWithCGRect:CGRectMake(view.frame.origin.x - margin,
                                        view.frame.origin.y - margin,
                                        view.frame.size.width + margin * 2,
                                        view.frame.size.height + margin * 2)];
}

// viewDidLoadで呼ぶとAutoLayout前のサイズを取得してしまうので
// viewDidAppearで使用する
- (void)configureCoachMarksView
{
    float margin = 10.0;
    
    // Setup coach marks
    NSArray *coachMarks = @[
                            @{
                                @"rect":[self frameSizeWithView:self.label margin:margin],
                                @"caption": NSLocalizedString(@"Tap to next scene.", @"画面をタップすると次に進みます")
                                },
                            @{
                                @"rect": [self frameSizeWithView:self.slider margin:margin],
                                @"caption": NSLocalizedString(@"You can see where to attention in the spotlight function", @"スポットライト機能で注目すべき場所がわかります")
                                },
                            @{
                                @"rect": [self frameSizeWithView:self.uiswitch margin:margin],
                                @"caption": NSLocalizedString(@"The size of the spotlight you can adjust.", @"スポットライトのサイズは調整できます")
                                },
                            @{
                                @"rect": [self frameSizeWithView:self.closeButton margin:margin],
                                @"caption": NSLocalizedString(@"If you want to end the demo, and then press the close button.", @"デモを終了する場合、閉じるボタンを押します")
                                },
                            @{
                                @"rect": [self frameSizeWithView:self.demoStartButton margin:margin],
                                @"caption": NSLocalizedString(@"You can introduce about your app, like this.", @"このようにアプリの機能紹介に利用できます")
                                }
                            ];
    self.coachMarksView = [[WSCoachMarksView alloc] initWithFrame:self.view.bounds coachMarks:coachMarks];
    [self.view addSubview:self.coachMarksView];
    
}

#pragma mark -
#pragma mark IBAction Method
- (IBAction)showCoachMarkButtonPressed:(id)sender {
    [self.coachMarksView start];
}

- (IBAction)closeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
